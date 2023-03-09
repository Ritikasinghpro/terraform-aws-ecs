module "ecs_cluster" {
  source               = "git@github.com:Ritikasinghpro/terraform-aws-ecs.git"
  name                 = var.name
  }

module "task-definition" {
  source = "git@github.com:Ritikasinghpro/terraform-aws-ecs.git"
  name   = "nginx-td"
  family = "test-td"  #unique name for task defintion
  network_mode = "bridge"
  requires_compatibilities = "EC2"
  logConfiguration = {
    logDriver = "awslogs"
    options = {
      awslogs-group  = "awslogs-test"
      awslogs-region = "us-east-1"
    }
  }
  portMappings = [
    {
      containerPort = 8080
      protocol      = "TCP"
    }
  ]
}


