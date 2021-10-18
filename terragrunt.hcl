remote_state {
  
  backend = "s3"

  config = {
    bucket  = "d4m-terraform-states"
    key     = "${path_relative_to_include()}/terraform.tfstate"
    region  = "eu-north-1"
    #profile = "terraform"                                   # uncomment for local use, keep it commented for Jenkins
    encrypt = true
    dynamodb_table = "terraform_state_aws_eu_north_1"
  }
}