output "instance_id_dbs" {
  description = "ID of the EC2 instance Ubuntu  with DB"
  value       = aws_instance.ubuntu.id
}

output "tag_name_dbs" {
  description = "Tag name of instance Ubuntu with DB"
  value       = aws_instance.ubuntu.tags.Name
}

output "instance_public_ip_dbs" {
  description = "Public IP address of the EC2 instance Ubuntu with DB"
  value       = aws_instance.ubuntu.public_ip
}

output "instance_id_ws" {
  description = "ID of the EC2 instance Amazon linux with webserver"
  value       = aws_instance.aml.id
}

output "tag_name__ws" {
  description = "Tag name of instance Amazon linux with webserver"
  value       = aws_instance.aml.tags.Name
}

output "instance_public_ip_ws" {
  description = "Public IP address of the EC2 instance Amazon linux with webserver"
  value       = aws_instance.aml.public_ip
}
