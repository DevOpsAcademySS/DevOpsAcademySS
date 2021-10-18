
provider "aws" {
  region     = var.aws-region
}

terraform {
  required_providers {
    aws = "3.62.0"
  }
  required_version = "1.0.8"
}



/*
terraform {
  //backend "s3" {}
  required_providers {
    aws = "3.62.0"
    google = "3.87.0"
  }
  required_version = "1.0.8"
}
provider "aws" {
  //shared_credentials_file = ".aws/credentials"
  //access_key = var.access_key_id
  //secret_key = var.secret_access_key
  region     = var.aws-region
}
provider "google" {
  //credentials = file(var.credentials_path)
  project     = var.gcp-project
  region      = var.gcp-region
  zone        = var.gcp-zone
}
*/