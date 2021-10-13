
output "elb" {
  value = aws_elb.geo_load_balancer.dns_name
}
