
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
