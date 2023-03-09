resource "aws_ecs_cluster" "ecs" {
  name = var.name
  setting {
    name  = "containerInsights"
    value = var.container_insights ? "enabled" : "disabled"
  }

}

resource "aws_ecs_task_definition" "my_taskdefinition" {
  family                   = "my_taskdefinition"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  execution_role_arn       = "arn:aws:iam::111111111111:role/execution-role"
  task_role_arn            = "arn:aws:iam::111111111111:role/task-role"
  container_definitions = jsonencode(
    [{
      name             = "nginx"
      image            = "nginx:latest"
      essential        = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 0
          protocol      = "tcp"
        }
      ]
      cpu               = 256
      memory            = 512
      mountPoints = []
      volumesFrom = []
    }]
  )
}


