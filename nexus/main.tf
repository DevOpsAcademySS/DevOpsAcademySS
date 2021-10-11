provider "google" {
  credentials = var.credentials
  project     = var.project
  region      = var.region
  zone        = var.zone
  user_project_override = true
}

resource "google_compute_instance" "ubuntu" {
  name = "nexus3"
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
  name = "nexusrules3"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["8081", "8095"]
  }
}

output "ip" {
  value = google_compute_instance.ubuntu.network_interface.0.access_config.0.nat_ip
}

terraform {
  backend "gcs" {}
}
