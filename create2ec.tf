provider "aws" {
  region     = var.region
}

resource "aws_instance" "ubuntu_terr" {
  ami           = var.ubuntu_ins
  instance_type = var.ins_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.geo_db.id]
  tags          = {
    Name = "Ubuntu_geo_db"
  }

}

resource "aws_instance" "amazon_lin_terr" {
  ami           = var.amazon_lin_ins
  instance_type = var.ins_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.geo_web_server.id]
  tags          = {
    Name = "Amazon_linux_geo_fr&back"
  }
}

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

resource "aws_security_group" "geo_db" {
  name = "Database security group"
  dynamic "ingress" {
    for_each = var.allow_ports_db
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