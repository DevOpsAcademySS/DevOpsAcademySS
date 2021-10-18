

resource "google_compute_firewall" "default" {
  name    = "nexus-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = var.ports
  }
}