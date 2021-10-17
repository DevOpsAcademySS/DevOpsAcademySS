resource "aws_security_group" "postgres_sg" {
  name        = "psql_sg"
  description = "Security group for PostgreSQL"
  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Allow Postgres TCP ingress ports"
      from_port        = 5432
      ipv6_cidr_blocks = ["::/0"]
      protocol         = "tcp"
      to_port          = 5432
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      description      = "Allow all egress ports"
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}
