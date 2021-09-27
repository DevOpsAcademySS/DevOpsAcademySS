terraform {
  backend "s3" {
    bucket = "devopacademyss-geocitizen-tfstate"
    encrypt = true
    key = "AWS-tf_states/jenkins/terraform.tfstate"
    region = "eu-north-1"
  }
  required_providers {
    aws = {
      version = "3.59.0"
    }
  }
}
