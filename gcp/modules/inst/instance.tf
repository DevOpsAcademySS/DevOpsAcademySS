resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.instance_type

  boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }

  depends_on = [
    google_compute_firewall.default
  ]
}
