resource "aws_instance" "testAmazon" {
  ami                    = "ami-0f0b4cb72cf3eadf3"
  instance_type          = "t3.micro"
  key_name               = "d4mgeocitizen"
  vpc_security_group_ids = [aws_security_group.tomcat_sec_group.id]
  tags = {
    "Name" = "Amazon-server-geo"
  }
}
