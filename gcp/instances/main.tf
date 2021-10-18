

resource "google_compute_instance" "nexus_server" {
  name         = "nexus-server"
  machine_type = var.nexus-machine_type
  boot_disk {
    initialize_params {
      image = var.nexus-boot_disk_image
    }
  }
  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
  metadata = {
    ssh-keys = "kateryna:${file("~/.ssh/id_rsa.pub")}"
  }
}

