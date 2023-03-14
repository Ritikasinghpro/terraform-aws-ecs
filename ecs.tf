resource "aws_ecs_cluster" "ecs" {
  name = var.name
  setting {
    name  = "containerInsights"
    value = var.container_insights ? "enabled" : "disabled"
  }
  tags = {
    Name = var.name
  }
}

resource "aws_ecs_task_definition" "task_definition" {
  for_each                 = var.task_definition
  family                   = each.value.name
  requires_compatibilities = each.value.requires_compatibilities
  network_mode             = each.value.network_mode
  execution_role_arn       = aws_iam_role.task_definition_role.arn
  task_role_arn            = aws_iam_role.task_definition_role.arn
  tags = {
        Name = each.value.name
        }
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

resource "aws_ecs_service" "ecs_service" {
  for_each        = var.service
  name            = each.value.name
  cluster         = aws_ecs_cluster.ecs.id
  task_definition = aws_ecs_task_definition.task_definition[each.value.task_definition_name].arn
  desired_count   = each.value.desired_count
  force_new_deployment = each.value.force_new_deployment
  # health_check_grace_period_seconds = each.value.health_check_grace_period_seconds 
  tags = {
    Name = each.value.name
  }
  deployment_maximum_percent         = each.value.deployment_maximum_percent 
  deployment_minimum_healthy_percent = each.value.deployment_minimum_healthy_percent  
  # iam_role        = aws_iam_role.task_definition_role.arn
  # depends_on      = [aws_iam_role_policy.foo]

  # ordered_placement_strategy {
  #   type  = "binpack"
  #   field = "cpu"
  # }

  # load_balancer {
  #   target_group_arn = data.aws_lb_target_group.test.arn
  #   container_name   = "test1"
  #   container_port   = 8080
  # }

  # placement_constraints {
  #   type       = "memberOf"
  #   expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  # }
}

provider "aws" {
  region = "us-east-1"
}


