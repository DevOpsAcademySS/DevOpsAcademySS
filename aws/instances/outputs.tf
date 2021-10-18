
// ip address of Amazon Linux instance
output "amazon-linux_ip_address" {
  value = aws_instance.amazon_linux.public_ip
}

