output "instance_public_ip" {
  value = google_compute_instance.vm_instance.network_interface
}
