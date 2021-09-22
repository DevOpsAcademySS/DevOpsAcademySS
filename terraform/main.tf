terraform {
  backend "s3" {
    bucket = "geocitizen.kbob"
    key    = "terraform/terraform.tfstate"
    region = "eu-north-1"
  }
}

provider "aws" {
  region = "eu-north-1"
}



resource "aws_instance" "ubuntu" {
  ami                    = "ami-0ff338189efb7ed37"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_postgres.id]
  key_name               = var.key_name

  tags = {
    Name    = var.instance_name_1
    Owner   = var.owner_name
    Project = var.project_name
  }
}

resource "aws_security_group" "allow_postgres" {
  name        = "allow_postgres"
  description = "Allow port 5432 and 22 for DB and ssh inbound traffic"

  ingress {
    description = "in 5432 port"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "in 22 port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "inbound 5432 & 22"
  }
}

resource "aws_instance" "aml"{
    ami           = "ami-0f0b4cb72cf3eadf3"
    instance_type = "t3.micro"
 
    vpc_security_group_ids = [aws_security_group.allow_tomcat.id]
    key_name               = var.key_name

    tags = {
      Name    = var.instance_name_2
      Owner   = var.owner_name
      Project = var.project_name
    }
}
  resource "aws_security_group" "allow_tomcat" {
  name        = "allow_tomcat"
  description = "Allow port 8080 and 22 for WS and ssh inbound traffic"

  ingress {
    description = "in 5432 port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "in 22 port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "inbound 8080 & 22"
  }  
}

data "template_file" "dev_hosts" {
  template = "${file("${path.module}/templates/dev_hosts.cfg")}"
  depends_on = [
    aws_instance.ubuntu,
    aws_instance.aml,
  ]
  vars = {
    api_ubuntu = "${aws_instance.ubuntu.public_ip}"
    api_aml = "${aws_instance.aml.public_ip}"
  }
}

resource "null_resource" "dev-hosts" {
  triggers = {
    template_rendered = "${data.template_file.dev_hosts.rendered}"
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.dev_hosts.rendered}' > hosts.txt"
  }
}
