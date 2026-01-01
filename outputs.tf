output "vpc_id" {
  description = "VPC_ID"
  value       = aws_vpc.main.id
}

output "ecr_pull_through_cache_prefix" {
  description = "ECR pull through cache repository prefix"
  value       = aws_ecr_pull_through_cache_rule.ecr_public.ecr_repository_prefix
}

output "ecr_login_command" {
  description = "ECR login command"
  value       = "aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com"
}

output "docker_pull_command" {
  description = "Docker pull command for nginx via pull through cache"
  value       = "docker pull ${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${var.project_name}-ecr-public/nginx/nginx:stable-alpine"
}

output "docker_build_command" {
  description = "Docker build command"
  value       = "docker build --build-arg AWS_ACCOUNT_ID=${data.aws_caller_identity.current.account_id} --build-arg ECR_PREFIX=${var.project_name}-ecr-public -t ${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${var.project_name}-app/${var.app_name}:latest ./app"
}

output "docker_push_command" {
  description = "Docker push command (will create repository via create on push)"
  value       = "docker push ${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${var.project_name}-app/${var.app_name}:latest"
}

output "ecs_cluster_name" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.main.name
}
