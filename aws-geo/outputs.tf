
output "amazon-server-public-ip" {
  value = aws_instance.testAmazon.public_ip
}
output "ubuntu-server-public-ip" {
  value = aws_instance.testUbuntu.public_ip
}
