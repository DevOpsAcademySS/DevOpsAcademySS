provider "google" {
  credentials = file("~/.ssh/gcp-key.json")
  project     = var.projectName
  region      = "europe-west1"

}