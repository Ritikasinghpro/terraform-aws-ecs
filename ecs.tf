resource "aws_ecs_cluster" "ecs" {
  name = var.name
  setting {
    name  = "containerInsights"
    value = var.container_insights ? "enabled" : "disabled"
  }

}

resource "aws_ecs_task_definition" "tas_definition" {
  for_each                 = var.task_definition
  family                   = each.value.name
  requires_compatibilities = each.value.requires_compatibilities
  network_mode             = each.value.network_mode
  execution_role_arn       = aws_iam_role.task_definition_role.arn
  task_role_arn            = aws_iam_role.task_definition_role.arn
  container_definitions = jsonencode(
    [{
      name      = each.value.container_name
      image     = each.value.image
      essential = true
      portMappings = [
        {
          containerPort = each.value.containerPort
          hostPort      = 0
          protocol      = "tcp"
        }
      ]
      cpu         = each.value.cpu
      memory      = each.value.memory
      mountPoints = []
      volumesFrom = []
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = each.value.log_group
          awslogs-region        = "us-east-1"
          awslogs-stream-prefix = "ecs"
        }
        # "secretOptions": [{
        # 	"name": "splunk-token",
        # 	"valueFrom": "/ecs/logconfig/splunkcred"
        # }]
      }
    }]
  )
}

provider "aws" {
  region = "us-east-1"
}


