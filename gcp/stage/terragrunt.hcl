# generate "provider" {
#   path = "provider.tf"
#   if_exists = "overwrite_terragrunt"
#   contents = <<EOF
# provider "google" {
#   project = var.gcp_proj_name
#   region  = var.gcp_region
#   zone    = var.gcp_zone
# }
# EOF
# }