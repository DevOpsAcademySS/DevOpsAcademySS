resource "google_compute_firewall" "default" {
  name          = var.fw_name
  network       = "default"
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = var.fw_ports
  }

  source_tags = ["web"]
}
