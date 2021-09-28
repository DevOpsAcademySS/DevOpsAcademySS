terraform {
  backend "s3" {
    bucket = "devopacademyss-geocitizen-tfstate"
    key = "AWS-tf_states/ubuntu/terraform.tfstate"
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


# dynamodb table for state file locking

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "terraform-state-lock"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}
