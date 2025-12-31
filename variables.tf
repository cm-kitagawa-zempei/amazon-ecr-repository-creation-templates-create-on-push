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

variable "allowed_cidr_block" {
  description = "CIDR blocks allowed to access the application"
  type        = list(string)
  default     = []
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "my-app"
}
