resource "aws_security_group" "geo_sg" {
  name        = var.sg_name
  description = var.sg_desc
  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Allow all ingress ports"
      from_port        = ingress.value
      ipv6_cidr_blocks = ["::/0"]
      protocol         = "tcp"
      to_port          = ingress.value
    }
  }

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      description      = "Allow all egress ports"
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}
