resource "aws_db_instance" "geo_db" {
  identifier             = var.db_identifire
  engine                 = "postgres"
  engine_version         = "12.5"
  name                   = var.db_name
  instance_class         = var.instance_type
  username               = var.db_user
  password               = var.db_pass
  allocated_storage      = 20
  vpc_security_group_ids = [aws_security_group.postgres_sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = var.pub_access
}
