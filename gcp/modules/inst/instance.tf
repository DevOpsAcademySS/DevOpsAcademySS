resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.instance_type

  boot_disk {
    initialize_params {
      image = var.instance_image
      size = var.disk_size
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = var.network_name # google_compute_network.vpc_network.name
    access_config {
    }
  }

  tags = var.trgt_tags # network tags

  depends_on = [
    google_compute_firewall.default
  ]
}
