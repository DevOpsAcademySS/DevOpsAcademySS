provider "google" {
  credentials = var.credentials
  project     = var.project
  region      = var.region
  zone        = var.zone
  user_project_override = true
}

resource "google_compute_instance" "Ubuntu" {
  name = "nexus"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20201014"
    }
  }

   network_interface {
    network = "default"
    access_config {
    }
  }
}

resource "google_compute_firewall" "nexus-rules" {
  name = "nexusrules"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["8081", "8095"]
  }
}

output "ip" {
  value = google_compute_instance.Ubuntu.network_interface.0.access_config.0.nat_ip
}

output "folder_id" {
  value       = google_folder.folder.id
  description = "The ID of the folder"
}

terraform {
  backend "gcs" {}
}

resource "google_folder" "folder" {
  display_name = "terragrunt_demo_child"
  parent       = var.parent_folder_id
}