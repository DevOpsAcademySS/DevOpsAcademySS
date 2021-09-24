terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = ">=0.14.9"
}

provider "aws" {
  region = var.default_region
}

resource "aws_instance" "redhat_geocitizen_service" {
  ami                    = "ami-0f0b4cb72cf3eadf3"
  instance_type          = "t3.micro"
  key_name               = "andre centos 7 core"
  vpc_security_group_ids = [aws_security_group.redhat_security.id]
  tags = {
    Name = "Red Hat Geocitizen"
  }
}

resource "aws_instance" "ubuntu_database_srvice" {
  ami                    = "ami-0ff338189efb7ed37"
  instance_type          = "t3.micro"
  key_name               = "andre ubuntu server 20.04"
  vpc_security_group_ids = [aws_security_group.ubuntu_security.id]
  tags = {
    Name = "Ubuntu PostgreSQL"
  }
}
