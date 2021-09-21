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
  # access_key = var.access_key_id
  # secret_key = var.secrett_access_key
  region = var.default_region
}

resource "aws_instance" "redhat_geocitizen_service" {
  ami           = "ami-0baa9e2e64f3c00db"
  instance_type = "t3.micro"
  key_name      = "andre centos 7 core"
  # key_name               = "redhat-key" # key name for aws key pair ssh connection
  vpc_security_group_ids = [aws_security_group.redhat_security.id]
  tags = {
    Name = "Red Hat Geocitizen"
  }
  # connection {
  #   type        = "ssh"
  #   host        = self.public_ip
  #   user        = "ec2-user"
  #   private_key = file("/home/andre/.ssh/aws/aws_key")
  #   timeout     = "4m"
  # }
}

resource "aws_instance" "ubuntu_database_srvice" {
  ami           = "ami-0ff338189efb7ed37"
  instance_type = "t3.micro"
  key_name      = "andre ubuntu server 20.04"
  # key_name               = "ubuntu-key" # key name for aws key pair ssh connection
  vpc_security_group_ids = [aws_security_group.ubuntu_security.id]
  tags = {
    Name = "Ubuntu PostgreSQL"
  }
  # connection {
  #   type        = "ssh"
  #   host        = self.public_ip
  #   user        = "ec2-user"
  #   private_key = file("/home/andre/.ssh/aws/aws_key")
  #   timeout     = "4m"
  # }
  # credit_specification {
  #   cpu_credits = "standard"
  # }
}
