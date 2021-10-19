

remote_state {
  backend = "s3"
  config = {
    bucket = "devopacademyss-geocitizen-tfstate-demo2"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    dynamodb_table = "terragrunt-state-lock"
  }
}


generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<-EOF
    terraform {
      backend "s3" {}
      required_providers {
        aws = "3.62.0"
        google = "3.87.0"
      }
      required_version = "1.0.8"
    }
  EOF
}



