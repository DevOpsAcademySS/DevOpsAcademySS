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
  description = "Allow port 5432, 9011 and 22 for DB and ssh inbound traffic"

  ingress {
    description = "in 5432 port"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "in 9100 port"
    from_port   = 9100
    to_port     = 9100
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
  description = "allow port 8080, 9100 and 22 for WS and ssh inbound traffic"

  ingress {
    description = "in 8080 port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "in 9100 port"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "in 8088 port"
    from_port   = 8088
    to_port     = 8088
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
    ip_of_ubuntu = "${aws_instance.ubuntu.public_ip}"
    ip_of_aml = "${aws_instance.aml.public_ip}"
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

data "template_file" "db_ip" {
  template = "${file("${path.module}/templates/db_ip.cfg")}"
  depends_on = [
    aws_instance.ubuntu
  ]
  vars = {
    ip_of_ubuntu = "${aws_instance.ubuntu.public_ip}"
  }
}

resource "null_resource" "db_ip" {
  triggers = {
    template_rendered = "${data.template_file.db_ip.rendered}"
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.db_ip.rendered}' > db_ip.txt"
  }
}

data "template_file" "ws_ip" {
  template = "${file("${path.module}/templates/ws_ip.cfg")}"
  depends_on = [
    aws_instance.aml
  ]
  vars = {
    ip_of_aml = "${aws_instance.aml.public_ip}"
  }
}

resource "null_resource" "ws_ip" {
  triggers = {
    template_rendered = "${data.template_file.ws_ip.rendered}"
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.ws_ip.rendered}' > ws_ip.txt"
  }
}