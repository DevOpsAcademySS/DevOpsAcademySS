resource "aws_route53_record" "www" {
  zone_id = "Z00237743MF0PI9106W10"
  name    = "geocitizen.link"
  type    = "A"

  alias {
    name                   = aws_elb.geo_load_balancer.dns_name
    zone_id                = aws_elb.geo_load_balancer.zone_id
    evaluate_target_health = true
  }
}
