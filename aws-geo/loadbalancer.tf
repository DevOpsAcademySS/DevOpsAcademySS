resource "aws_elb" "geo_load_balancer" {
  name               = "geo-load-balancer"
  availability_zones = ["eu-north-1a"]
  security_groups    = [aws_security_group.tomcat_sec_group.id]

  #   access_logs {
  #     bucket        = "foo"
  #     bucket_prefix = "bar"
  #     interval      = 60
  #   }

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 8080
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:8080/"
    interval            = 10
  }

  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 300

  tags = {
    Name = "geo-load-balancer"
  }
}
