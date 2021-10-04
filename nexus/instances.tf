resource "google_compute_instance" "default" {
  name         = "terra-nexus"
  machine_type = "e2-highcpu-4"
  zone         = "europe-west1-d"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20210908"
      size  = "30"
    }
  }

  tags = ["nexus"]

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }

  metadata = {
    ssh-keys = "day4me:${file("~/.ssh/gcp_d4m_rsa.pub")}"
  }
}
