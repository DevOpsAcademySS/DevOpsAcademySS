
output "amazon-server-public-ip" {
  value = aws_instance.testAmazon.public_ip
}
