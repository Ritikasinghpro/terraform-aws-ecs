module "ecs_cluster" {
  source               = "git@github.com:Ritikasinghpro/terraform-aws-ecs.git?ref=b1"
  name                 = var.name
  task_definition      = var.task_definition
  service              = var.service
  container_insights   = true
  }







