terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = ">=0.14.9"
}

provider "aws" {
  region = var.aws_region
  # assume_role {
  #   role_arn = var.rds_role_arn
  # }
}
