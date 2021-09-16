resource "aws_instance" "testAmazon" {
  ami                    = "ami-0f0b4cb72cf3eadf3"
  instance_type          = "t3.micro"
  key_name               = "d4mgeocitizen"
  vpc_security_group_ids = [aws_security_group.tomcat_sec_group.id]
  tags = {
    "Name" = "Amazon-server-geo"
  }
}


resource "aws_security_group" "tomcat_sec_group" {
  name        = "Tomcat security group"
  description = "Security group for Tomcat server, Geocitizen."

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  tags = {
    "Name" = "Tomcat-sec-group"
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

resource "aws_security_group" "postgres_sec_group" {
  name        = "PostgreSQL security group"
  description = "Security group for PostgreSQL database for Geocitizen."

  ingress {
    cidr_blocks = ["${aws_instance.testAmazon.public_ip}/32"]
    from_port   = 5432
    protocol    = "tcp"
    to_port     = 5432
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  tags = {
    "Name" = "Postgres-sec-group"
  }
  #timeouts {
  #  create = "10s"
  #}
}

output "amazon-server-public-ip" {
  value = aws_instance.testAmazon.public_ip
}
output "ubuntu-server-public-ip" {
  value = aws_instance.testUbuntu.public_ip
}
