provider "aws" {
  region        = var.region
}

// aws_instances

resource "aws_instance" "jenkins-agent" {
  ami           = var.ubuntu_server-ami
  instance_type = var.ubuntu_server-instance_type
  tags          = { Name = "jenkins agent" }
  key_name      = "geo"
  vpc_security_group_ids = [aws_security_group.ubuntu_server-security.id]
}
