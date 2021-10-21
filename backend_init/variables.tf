// aws provider vars
variable "aws-region" {
  description = "AWS region for the S3 and DynamoDB"
  type = string
  default = "eu-north-1"
}

// gcp provider vars
variable "gcp-project" {
  default = "ss-geo-327714"
}
variable "gcp-region" {
  default = "europe-north1-a"
}
variable "gcp-zone" {
  default = "us-central1-c"
}

// remote backend vars
variable "state_bucket" {
  default = "devopacademyss-geocitizen-tfstate-demo1"
}
variable "dynamodb_table" {
  default = "terraform-state-lock"
}