# Amazon ECR リポジトリ作成テンプレート検証

ECR の「リポジトリ作成テンプレート」と「Create on push」機能を検証するプロジェクト。

## 実行環境

- ローカル: Apple Silicon Mac（ARM64）
- Fargate: ARM64（Graviton）

## pre-commit

```sh
# フックのインストール
pre-commit install

# 全ファイルに対しての手動実行
pre-commit run --all-files

# 特定のフックのみ実行
pre-commit run terraform_fmt --all-files

# フックのアンインストール
pre-commit uninstall

# フックの更新
pre-commit autoupdate
```

## Terraform docs

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.100.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecr_pull_through_cache_rule.ecr_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_pull_through_cache_rule) | resource |
| [aws_ecr_repository_creation_template.ecr_public_pull_through_cache](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_creation_template) | resource |
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_role.ecs_task_execution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecs_task_execution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_availability_zones.avalilable](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_prefix_list_id"></a> [allowed\_prefix\_list\_id](#input\_allowed\_prefix\_list\_id) | Prefix list ID allowed to access the application | `string` | `""` | no |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application name | `string` | `"my-app"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `"ap-northeast-1"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name | `string` | `"ecr-template-demo"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for VPC | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_docker_build_command"></a> [docker\_build\_command](#output\_docker\_build\_command) | Docker build command |
| <a name="output_docker_pull_command"></a> [docker\_pull\_command](#output\_docker\_pull\_command) | Docker pull command for nginx via pull through cache |
| <a name="output_docker_push_command"></a> [docker\_push\_command](#output\_docker\_push\_command) | Docker push command (will create repository via create on push) |
| <a name="output_ecr_login_command"></a> [ecr\_login\_command](#output\_ecr\_login\_command) | ECR login command |
| <a name="output_ecr_pull_through_cache_prefix"></a> [ecr\_pull\_through\_cache\_prefix](#output\_ecr\_pull\_through\_cache\_prefix) | ECR pull through cache repository prefix |
| <a name="output_ecs_cluster_name"></a> [ecs\_cluster\_name](#output\_ecs\_cluster\_name) | ECS cluster name |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC\_ID |
<!-- END_TF_DOCS -->
