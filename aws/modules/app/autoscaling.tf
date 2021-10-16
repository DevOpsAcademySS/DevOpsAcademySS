resource "aws_autoscaling_group" "geo_asg" {
  availability_zones        = var.availability_zones
  name                      = "terraform-asg"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true
  launch_configuration      = aws_launch_configuration.geo_launch.name
  load_balancers            = [aws_elb.geo_elb.name]
  tag {
    key                 = "Name"
    value               = "GeocitizenScale"
    propagate_at_launch = true
  }
  tag {
    key                 = "Type"
    value               = "Autoscale"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "geo_asp_up" {
  name                   = "terraform-asp"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 90
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.geo_asg.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    disable_scale_in = true
    target_value     = 70.0
  }
}

resource "aws_autoscaling_policy" "geo_asp_down" {
  name                   = "terraform-asp"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 90
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.geo_asg.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    disable_scale_in = true
    target_value     = 30.0
  }
}

resource "aws_launch_configuration" "geo_launch" {
  name                        = "geo-launch"
  image_id                    = var.instance_ami
  instance_type               = var.instance_type
  key_name                    = var.ssh_key_name
  associate_public_ip_address = true
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = 10
    volume_type           = "gp2"
  }
  security_groups = [aws_security_group.geo_sg.id]
  user_data       = <<-EOF
  #!/bin/bash

  #### Install Docker

  apt-get update
  apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  apt-get update
  apt-get install docker-ce docker-ce-cli containerd.io -y

  #### Run Geo Citizen

  # docker login -u yor_ussername -p yor_password
  # docker run  --name container_name -d -p 8080:8080 192.168.1.10:8085/geo-docker:v1
  EOF
}
