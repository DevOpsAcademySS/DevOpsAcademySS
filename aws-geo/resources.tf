data "aws_secretsmanager_secret_version" "host_conf_key" {
  # Fill in the name you gave to your secret
  secret_id = "HOST_CONFIG_KEY"
}
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

resource "aws_launch_configuration" "amazontomcat" {
  name_prefix                 = "tomcatserv-launch-config"
  image_id                    = "ami-0f0b4cb72cf3eadf3"
  instance_type               = "t3.micro"
  key_name                    = "d4mgeocitizen"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.tomcat_sec_group.id]
  # user_data                   = <<-EOF
  #   #!/bin/bash
  #   sudo su
  #   yum -y install httpd
  #   echo "<p> My Instance! </p> $(curl ifconfig.me)" >> /var/www/html/index.html
  #   sed -E -i '/^Listen/s/80/8080/g' /etc/httpd/conf/httpd.conf
  #   sudo systemctl enable httpd
  #   sudo systemctl start httpd
  # EOF

  user_data = <<-EOF
  #!/bin/bash
          exec > /tmp/autoscale.log 2>&1
          set -x
          TOWER_ADDRESS=34.78.202.11
          TEMPLATE_ID=10
          HOST_CONFIG_KEY=${data.aws_secretsmanager_secret_version.host_conf_key.secret_string}
          retry_attempts=10
          attempt=0
          while [[ $attempt -lt $retry_attempts ]]
          do
            status_code=`curl -s -i -H "Content-Type: application/json" --data '{"host_config_key": "'$HOST_CONFIG_KEY'"}' http://$TOWER_ADDRESS/api/v2/job_templates/$TEMPLATE_ID/callback/ | head -n 1 | awk '{print $2}'`
            if [[ $status_code == 201 ]]
              then
              exit 0
            fi
            attempt=$(( attempt + 1 ))
            echo "$status_code received... retrying in 1 minute. (Attempt $attempt)"
            sleep 60
          done
          exit 1
  EOF

  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_autoscaling_group" "geo_autoscale_group" {
  availability_zones        = ["eu-north-1a"]
  name                      = "geo-autoscale-group"
  load_balancers            = [aws_elb.geo_load_balancer.name]
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 2
  health_check_grace_period = 100
  health_check_type         = "EC2"
  force_delete              = true
  launch_configuration      = aws_launch_configuration.amazontomcat.name
  tag {
    key                 = "Name"
    value               = "geo-tomcat-serv"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "geo-autoscale-policy" {
  name                   = "geo-autoscale-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.geo_autoscale_group.name
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "cpu-alarm" {
  alarm_name          = "geo-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "70"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.geo_autoscale_group.name
  }
  actions_enabled   = true
  alarm_description = "This metric monitors ec2 cpu utilization if its >= 70 +1 instance"
  alarm_actions     = [aws_autoscaling_policy.geo-autoscale-policy.arn]
}

resource "aws_autoscaling_policy" "geo-autoscale-policy-scaledown" {
  name                   = "geo-autoscale-policy-scaledown"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.geo_autoscale_group.name
  policy_type            = "SimpleScaling"
}
resource "aws_cloudwatch_metric_alarm" "cpu-alarm-scaledown" {
  alarm_name          = "geo-cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.geo_autoscale_group.name
  }
  actions_enabled   = true
  alarm_description = "This metric monitors ec2 cpu utilization if its <= 30 -1 instance"
  alarm_actions     = [aws_autoscaling_policy.geo-autoscale-policy-scaledown.arn]
}
