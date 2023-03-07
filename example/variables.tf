locals {
  env = {
    dev = {
      cluster_name        = "ritika-ecs"
    }
  }

  workspace = local.env[dev.cluster_name]
}