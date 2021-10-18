
// aws_security_group for Amazon Linux instance

resource "aws_security_group" "amazon_linux-security" {
  name        = "amazon-linux_security"
  description = "Allow access for Geocitizen"

  dynamic "ingress" {
    for_each = var.amazon_linux-allowed_ports
    content {
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      description      = "Allow all ingress ports"
    }
  }
}