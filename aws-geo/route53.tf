resource "aws_route53_zone" "primary" {
  name = "d4mtestdeploy.com"
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "d4mtestdeploy.com"
  type    = "A"

  alias {
    name                   = aws_elb.geo_load_balancer.dns_name
    zone_id                = aws_elb.geo_load_balancer.zone_id
    evaluate_target_health = true
  }
}
