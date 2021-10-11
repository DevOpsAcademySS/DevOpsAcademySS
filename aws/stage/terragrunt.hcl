# generate "provider" {
#   path = "provider.tf"
#   if_exists = "overwrite_terragrunt"
#   contents = <<EOF
# provider "aws" {
#   assume_role {
#     role_arn = "arn:aws:iam::0123456789:role/terragrunt"
#   }
# }
# EOF
# }

# terraform {
#   extra_arguments "common_vars" {
#     commands = get_terraform_commands_that_need_vars()

#     arguments = [
#       "-var-file=aws.tfvars",
#     ]
#   }
# }

# remote_state {
#   backend = "s3"
#   generate = {
#     path      = "backend.tf"
#     if_exists = "overwrite_terragrunt"
#   }
#   config = {
#     bucket = "my-terraform-state"

#     key = "${path_relative_to_include()}/terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "my-lock-table"
#   }
# }