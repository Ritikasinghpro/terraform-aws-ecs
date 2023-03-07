locals {
  env = {
    dev = {
      cluster_name        = "dev-cluster"
    }
  }

  workspace = local.env[terraform.workspace]
}