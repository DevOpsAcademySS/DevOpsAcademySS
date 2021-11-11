
terraform {
  backend "s3" {
    bucket = "devopacademyss-geocitizen-tfstate-demo1"
    key = "AWS/jenkins-ubuntu/terraform.tfstate"
    dynamodb_table = "terraform-state-lock"
    region = "eu-north-1"
    encrypt = true
  }
  required_providers {
    aws = {
      version = "3.59.0"
    }
  }
}
