resource "aws_autoscaling_group" "geo_asg" {
  availability_zones        = var.availability_zones
  name                      = "terraform-asg"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 2
  health_check_grace_period = 150
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

resource "aws_autoscaling_policy" "geo_asp" {
  name                      = "terraform-asp"
  adjustment_type           = "ChangeInCapacity"
  policy_type               = "TargetTrackingScaling"
  autoscaling_group_name    = aws_autoscaling_group.geo_asg.name
  estimated_instance_warmup = 90
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    disable_scale_in = true
    target_value     = 50.0
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

  NEXUS_IP_PORT="192.168.1.10:8085"
  # echo -e "{\n\t\"insecure-registries\" : [\"http://$NEXUS_IP_PORT\"]\n}" > /etc/docker/daemon.json
  # service docker restart
  # docker login -u yor_ussername -p yor_password $NEXUS_IP_PORT
  # docker run  --name container_name -d -p 8080:8080 $NEXUS_IP_PORT/geo-docker:v1
  EOF
}
