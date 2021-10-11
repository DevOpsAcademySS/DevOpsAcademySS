terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.0"
    }
  }
  required_version = ">=0.14.9"
}

provider "google" {
  project = var.gcp_proj_name
  region  = var.gcp_region
  zone    = var.gcp_zone
}
