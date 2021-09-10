provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "Ubuntu" {
  ami = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.security_group.id]
}

resource "aws_instance" "CentOS" {
  ami = "ami-00dfe2c7ce89a450b"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.security_group.id]
}

resource "aws_security_group" "security_group" {
  name = "security_group"
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}















