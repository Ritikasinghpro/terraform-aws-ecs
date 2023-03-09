resource "aws_ecs_cluster" "ecs" {
  name = var.name
  setting {
    name  = "containerInsights"
    value = var.container_insights ? "enabled" : "disabled"
  }

}

resource "aws_ecs_task_definition" "task_definition" {
  for_each                 = var.task_definition
  family                   = each.value.name
  requires_compatibilities = each.value.requires_compatibilities
  network_mode             = each.value.network_mode
  execution_role_arn       = aws_iam_role.task_definition_role.arn
  task_role_arn            = aws_iam_role.task_definition_role.arn
  volume {
    name      = each.value.volume_name
    host_path = each.value.host_path
  }
  container_definitions = jsonencode(
    [{
      name      = each.value.container_name
      image     = each.value.image
      essential = true
      portMappings = [
        {
          containerPort = each.value.containerPort
          hostPort      = each.value.hostPort
          protocol      = each.value.protocol
        }
      ]
      cpu         = each.value.cpu
      memory      = each.value.memory
      mountPoints = each.value.mountPoints
      # mountPoints = [
      #   {
      #     sourceVolume  = "logs",
      #     containerPath = "/opt/logs"
      #   }
      # ]
      volumesFrom = []

      secrets = each.value.secrets
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = each.value.log_group
          awslogs-region        = each.value.region
          awslogs-stream-prefix = each.value.logs_prefix
        }
        # secretOptions = [
        #   {
        #     name      = "SECRET_MANAGER_ARN"
        #     valueFrom = each.value.secret_manager_arn
        #   }
        # ]
      }
    }]
  )
}

provider "aws" {
  region = "us-east-1"
}


