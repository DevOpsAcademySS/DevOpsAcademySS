output "redhat_public_ip_address" {
  value = aws_instance.redhat_geocitizen_service.public_ip
}

output "ubuntu_public_ip_address" {
  value = aws_instance.ubuntu_database_srvice.public_ip
}
