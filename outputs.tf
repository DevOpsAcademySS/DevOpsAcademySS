output "web_server_ip" {
  value = aws_instance.amazon_lin_terr.public_ip
}
output "db_ip" {
  value = aws_instance.ubuntu_terr.public_ip
}