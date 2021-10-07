resource "aws_security_group" "geo_web_server" {
  name = "Web server security group"
  dynamic "ingress" {
    for_each = var.allow_ports_web_server
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}