resource "aws_ecr_pull_through_cache_rule" "ecr_public" {
  ecr_repository_prefix = "${var.project_name}-ecr-public"
  upstream_registry_url = "public.ecr.aws"
}

resource "aws_ecr_repository_creation_template" "ecr_public_pull_through_cache" {
  prefix      = aws_ecr_pull_through_cache_rule.ecr_public.ecr_repository_prefix
  applied_for = ["PULL_THROUGH_CACHE"]

  image_tag_mutability = "MUTABLE"
  lifecycle_policy = jsonencode({
    rulePriority = 1
    description  = "Keep last 3 images"
    selection = {
      tagStatus   = "any"
      countType   = "imageCountMoreThan"
      countNumber = 3
    }
    action = {
      type = "expire"
    }
  })
}

