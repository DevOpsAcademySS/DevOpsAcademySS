provider "google" {
  credentials = file("~/.ssh/gcp-key.json")
  project     = "awxdevops"
  region      = "europe-west1"

}
