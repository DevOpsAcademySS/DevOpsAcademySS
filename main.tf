provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "Ubuntu" {
  ami = "ami-0d382e80be7ffdae5"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.security_group.id]
  tags = {
    Name = "Ubuntu"
  }
  key_name = "samirus"
}

resource "aws_instance" "CentOS" {
  ami = "ami-011996ff98de391d1"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.security_group.id]
  tags = {
    Name = "CentOS"
  }
  key_name = "samirus"
}

resource "aws_security_group" "security_group" {
  name = "security_group"
  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
    ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}















