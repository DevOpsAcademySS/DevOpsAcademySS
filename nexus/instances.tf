resource "google_compute_instance" "default" {
  name         = "nexus-ter"
  machine_type = "e2-highcpu-4"
  zone         = "europe-west1-d"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20210908"
      size  = "30"
    }
  }

  tags = ["nexus-fw"]

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }

  metadata = {
    ssh-keys = "serhii:${file("~/.ssh/gcp_geo_rsa.pub")}"
  }
}