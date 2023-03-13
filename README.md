# terraform-aws-ecs

[![Lint Status](https://github.com/tothenew/terraform-aws-ecs/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-ecs/actions)
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-ecs)](https://github.com/tothenew/terraform-aws-ecs/blob/master/LICENSE)

The following content needed to be created and managed:
 - Introduction
     - This terraform module builds an Empty Elastic Container Service(ECS) Cluster in AWS along with Services and Task definitions.
     - The following resources will be created:
        - Empty Cluster 
        - IAM Roles
        - Services
        - Task Definitions


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.10 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Usages

```
module "ecs_cluster" {
  source               = "git@github.com:Ritikasinghpro/terraform-aws-ecs.git?ref=b1"
  name                 = var.name
  task_definition      = var.task_definition
  service              = var.service
  container_insights   = false
  tags                 = {
    Name = var.name
  }
  }
```

## Inputs


| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="container_insights"></a> [custom\_domain](#input\container_insights) | n/a | `bool` | `true` | no |
| <a name="log_group"></a> [domain\_name](#input\log_group) | n/a | `string` | `n/a` | no |
| <a name="force_new_deployment"></a> [environment](#input\force_new_deployment) | n/a | `bool` | `true` | no |


## Outputs

No inputs.

## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-ecs/blob/main/LICENSE) for full details.

