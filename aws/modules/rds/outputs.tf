output "instance_public_ip" {
  value = aws_db_instance.geo_db.address
}
