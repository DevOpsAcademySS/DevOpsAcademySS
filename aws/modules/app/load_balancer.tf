# Create a new load balancer
resource "aws_elb" "geo_elb" {
  name               = "terraform-elb"
  availability_zones = var.availability_zones
  security_groups    = [aws_security_group.geo_sg.id]
  access_logs {
    bucket        = "foo"
    bucket_prefix = "bar"
    interval      = 60
  }

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8080/citizen"
    interval            = 30
  }

  instances                   = [aws_instance.geicitizen.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "terraform-elb"
  }
}
