
resource "google_compute_firewall" "rules" {
  project     = "geonexus"
  name        = "nexus-rules"
  network     = "default"
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol = "tcp"
    ports    = ["8081", "8095"]
  }
  target_tags = ["nexus-fw"]
}