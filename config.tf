terraform {
  backend "s3" {
    profile        = "terraform"
    bucket         = "d4m-terraform-states"
    encrypt        = true
    key            = "AWS/Dev/terraform-states/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform_state_aws_eu_north_1"
  }
  required_version = ">= 0.13"
}
provider "aws" {
  
}
