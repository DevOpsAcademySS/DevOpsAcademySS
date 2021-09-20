output "amazon-linux_ip_address" {
  value = aws_instance.amazon_linux.public_ip
}

output "ubuntu-server_ip_address" {
  value = aws_instance.ubuntu_server.public_ip
}
