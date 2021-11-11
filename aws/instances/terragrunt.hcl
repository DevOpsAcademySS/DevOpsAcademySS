
include "root" {
  path = find_in_parent_folders()
}

remote_state {
  backend = "s3"
  config = {
    bucket = "devopsacademyss-geocitizen-tfstate-aws"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    dynamodb_table = "terragrunt-state-lock"
  }
}
