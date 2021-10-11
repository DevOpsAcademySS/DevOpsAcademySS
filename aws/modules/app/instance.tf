resource "aws_instance" "geicitizen" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  key_name               = var.ssh_key_name
  vpc_security_group_ids = [aws_security_group.geo_sg.id]
  tags = {
    Docker = "true"
    Name   = var.tag_name
  }
}
