

provider "aws" {
  region     = var.aws-region
}

terraform {
  required_providers {
    aws = "3.62.0"
  }
  //required_version = "1.0.7"
}
