variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "ecr-template-demo"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "allowed_prefix_list_id" {
  description = "Prefix list ID allowed to access the application"
  type        = string
  default     = ""
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "my-app"
}
