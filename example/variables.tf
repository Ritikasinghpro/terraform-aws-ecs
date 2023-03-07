locals {
  env = {
    dev = {
      cluster_name        = "ritika-ecs"
    }
  }

  workspace = local.env[terraform.workspace]
}
