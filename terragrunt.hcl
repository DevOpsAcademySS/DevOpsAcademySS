  
remote_state {
  
  backend = "s3"

  config = {
    bucket  = "geobucketbalen"
    key     = "${path_relative_to_include()}/terraform.tfstate"
    region  = "eu-north-1"
    profile = "terraform"
    encrypt = true
    dynamodb_table = "terraform_state_aws_eu_north_1"
  }
}