locals {
  env = {
    dev = {
      cluster_name        = "ritika-ecs"
    }
  }

  workspace = local.env.dev[terraform.cluster_name]
}
