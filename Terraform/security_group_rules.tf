resource "aws_security_group" "redhat_security" {
  name        = "redhat_security"
  description = "Allow acces for Geocitizen"
  dynamic "ingress" {
    for_each = var.ports
    content {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Allow all ingress ports"
      from_port        = ingress.value
      ipv6_cidr_blocks = ["::/0"]
      protocol         = "tcp"
      to_port          = ingress.value
    }
  }
}

resource "aws_security_group" "ubuntu_security" {
  name        = "ubuntu_security"
  description = "Allow PostgreSQL"
  dynamic "ingress" {
    for_each = var.ports
    content {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Allow all ingress ports"
      from_port        = ingress.value
      ipv6_cidr_blocks = ["::/0"]
      protocol         = "tcp"
      to_port          = ingress.value
    }
  }
}

resource "aws_security_group_rule" "allow_all_redhat" {
  security_group_id = aws_security_group.redhat_security.id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow all egress ports"
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  to_port           = 0
}

resource "aws_security_group_rule" "allow_all_ubuntu" {
  security_group_id = aws_security_group.ubuntu_security.id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow all egress ports"
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  to_port           = 0
}

resource "aws_security_group_rule" "allow_tomcat" {
  type              = "ingress"
  security_group_id = aws_security_group.redhat_security.id
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow tomcat"
  from_port         = 8080
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "allow_postgres" {
  type              = "ingress"
  security_group_id = aws_security_group.ubuntu_security.id
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow postgresql"
  from_port         = 5432
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "tcp"
  to_port           = 5432
}

# resource "aws_security_group_rule" "allow_ssh_redhat" {
#   type              = "ingress"
#   security_group_id = aws_security_group.redhat_security.id
#   cidr_blocks       = ["0.0.0.0/0"]
#   description       = "Allow SSH"
#   from_port         = 22
#   ipv6_cidr_blocks  = ["::/0"]
#   protocol          = "tcp"
#   to_port           = 22
# }

# resource "aws_security_group_rule" "allow_ssh_ubuntu" {
#   type              = "ingress"
#   security_group_id = aws_security_group.ubuntu_security.id
#   cidr_blocks       = ["0.0.0.0/0"]
#   description       = "Allow SSH"
#   from_port         = 22
#   ipv6_cidr_blocks  = ["::/0"]
#   protocol          = "tcp"
#   to_port           = 22
# }

# resource "aws_security_group_rule" "allow_http_redhat" {
#   type              = "ingress"
#   security_group_id = aws_security_group.redhat_security.id
#   cidr_blocks       = ["0.0.0.0/0"]
#   description       = "Allow HTTP"
#   from_port         = 80
#   ipv6_cidr_blocks  = ["::/0"]
#   protocol          = "tcp"
#   to_port           = 80
# }

# resource "aws_security_group_rule" "allow_http_ubuntu" {
#   type              = "ingress"
#   security_group_id = aws_security_group.ubuntu_security.id
#   cidr_blocks       = ["0.0.0.0/0"]
#   description       = "Allow HTTP"
#   from_port         = 80
#   ipv6_cidr_blocks  = ["::/0"]
#   protocol          = "tcp"
#   to_port           = 80
# }

# resource "aws_security_group_rule" "allow_https_redhat" {
#   type              = "ingress"
#   security_group_id = aws_security_group.redhat_security.id
#   cidr_blocks       = ["0.0.0.0/0"]
#   description       = "Allow HTTP"
#   from_port         = 443
#   ipv6_cidr_blocks  = ["::/0"]
#   protocol          = "tcp"
#   to_port           = 443
# }

# resource "aws_security_group_rule" "allow_https_ubuntu" {
#   type              = "ingress"
#   security_group_id = aws_security_group.ubuntu_security.id
#   cidr_blocks       = ["0.0.0.0/0"]
#   description       = "Allow HTTP"
#   from_port         = 443
#   ipv6_cidr_blocks  = ["::/0"]
#   protocol          = "tcp"
#   to_port           = 443
# }

# resource "aws_security_group_rule" "allow_dns_tcp" {
#   type              = "ingress"
#   security_group_id = aws_security_group.redhat_security.id
#   cidr_blocks       = ["0.0.0.0/0"]
#   description       = "Allow DNS(TCP)"
#   from_port         = 53
#   ipv6_cidr_blocks  = ["::/0"]
#   protocol          = "tcp"
#   to_port           = 53
# }

# resource "aws_security_group_rule" "allow_dns_udp" {
#   type              = "ingress"
#   security_group_id = aws_security_group.redhat_security.id
#   cidr_blocks       = ["0.0.0.0/0"]
#   description       = "Allow DNS(UDP)"
#   from_port         = 53
#   ipv6_cidr_blocks  = ["::/0"]
#   protocol          = "udp"
#   to_port           = 53
# }
