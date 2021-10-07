resource "aws_instance" "amazon_lin_terr" {
  ami           = var.amazon_lin_ins
  instance_type = var.ins_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.geo_web_server.id]
  tags          = {
    Name = "Amazon_linux_geo_fr&back"
  }
}