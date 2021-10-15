provider "google" {
  credentials = var.credentials
  project     = var.project
  region      = var.region
  zone        = var.zone
  user_project_override = true
}

terraform {
  backend "gcs" {}
}

resource "google_compute_instance_template" "my_lamp_instance" {
  name           = "my-instance-template1"
  machine_type   = "e2-medium"
  can_ip_forward = false

  disk {
    source_image = "ubuntu-2004-focal-v20201014"
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  connection {
    host = self.network_interface.0.access_config.0.nat_ip
    type = "ssh"
    user = "samuelsharp"
    private_key = "GCP_SSH.pem"
    agent = "false"
    }

  provisioner "remote-exec" {
//    command = "docker run 2ti2225gz2/geocitizen:5"
    inline = [
      "docker run 2ti2225gz2/geocitizen:5",
      "echo 'sraka'"
    ]
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_firewall" "nexus-rules" {
  name = "nexusrules3"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }
  source_ranges = ["209.85.152.0/22", "209.85.204.0/22", "35.191.0.0/16"]
}

resource "google_compute_target_pool" "my_target_pool" {
  name = "my-target-pool-3"
  session_affinity = "NONE"
}

resource "google_compute_instance_group_manager" "my_group" {
  name = "my-igm1"
  zone = var.zone

  version {
    instance_template  = google_compute_instance_template.my_lamp_instance.id
    name               = "primary"
  }

  target_pools       = [google_compute_target_pool.my_target_pool.id]
  base_instance_name = "geo"
}

resource "google_compute_autoscaler" "autoscal" {
  name   = "my-autoscaler"
  zone   = var.zone
  target = google_compute_instance_group_manager.my_group.id

  autoscaling_policy {
    max_replicas    = 4
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}

resource "google_compute_forwarding_rule" "default" {
  name                  = "my-rule"
  target                = google_compute_target_pool.my_target_pool.self_link
  load_balancing_scheme = "EXTERNAL"
  ip_protocol           = "TCP"
}