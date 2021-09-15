provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "Ubuntu" {
  ami = "ami-0d382e80be7ffdae5"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.my_security_group.id]
  tags = {
    Name = "Ubuntu"
  }
  key_name = "samirus"
}

resource "aws_instance" "CentOS" {
  ami = "ami-011996ff98de391d1"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.my_security_group.id]
  tags = {
    Name = "CentOS"
  }
  key_name = "samirus"
}

resource "aws_security_group" "my_security_group" {
  name = "my_security_group"

  dynamic "ingress" {
    for_each = [
      "5432",
      "22",
      "8080"]
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [
        "0.0.0.0/0"]
    }
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}















