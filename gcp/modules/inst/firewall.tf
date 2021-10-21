resource "google_compute_firewall" "default" {
  name          = var.fw_name
  network       = google_compute_network.vpc_network.name
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = var.fw_ports
  }

  # source_tags = var.src_tags
  target_tags = var.trgt_tags
}
