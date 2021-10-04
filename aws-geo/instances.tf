resource "aws_instance" "testAmazon" {
  ami                    = "ami-0f0b4cb72cf3eadf3"
  instance_type          = "t3.micro"
  key_name               = "d4mgeocitizen"
  vpc_security_group_ids = [aws_security_group.tomcat_sec_group.id]
  tags = {
    "Name" = "Amazon-server-geo"
  }
}

resource "aws_instance" "testUbuntu" {
  ami                    = "ami-0ff338189efb7ed37"
  instance_type          = "t3.micro"
  key_name               = "d4mgeocitizen"
  vpc_security_group_ids = [aws_security_group.postgres_sec_group.id]
  tags = {
    "Name" = "Ubuntu-server-geo"
  }
  #timeouts {
  #  create = "10s"
  #}
}
