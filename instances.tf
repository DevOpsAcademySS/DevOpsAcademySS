provider "aws" {
  region        = var.region
}

// aws_instances

resource "aws_instance" "amazon_linux" {
  ami           = var.amazon_linux-ami
  instance_type = var.amazon_linux-instance_type
  tags          = { Name = "amazon linux" }
  vpc_security_group_ids = [aws_security_group.amazon_linux-security.id]
}

resource "aws_instance" "ubuntu_server" {
  ami           = var.ubuntu_server-ami
  instance_type = var.ubuntu_server-instance_type
  tags          = { Name = "ubuntu server" }
  vpc_security_group_ids = [aws_security_group.ubuntu_server-security.id]
}
