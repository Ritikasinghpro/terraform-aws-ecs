module "ecs_cluster" {
  source               = "git@github.com:Ritikasinghpro/terraform-aws-ecs.git"
  name                 = local.workspace["cluster_name"]
}