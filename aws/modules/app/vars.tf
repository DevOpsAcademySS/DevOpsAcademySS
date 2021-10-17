#=============instance vars=============
variable "instance_name" {
  type        = string
  description = "Specify name for instance"
}

variable "instance_ami" {
  type = string
  #default     = "ami-0f0b4cb72cf3eadf3"
  description = "Specify name for instance"
}

variable "instance_type" {
  type = string
  #default     = "t3.micro"
  description = "Specify type of the instance"
}

variable "ssh_key_name" {
  type = string
  #default     = "aws_master_key"
  description = "Specify name of ssh key from AWS"
}

variable "tag_name" {
  type        = string
  description = "Specify name of tag for instance"
}

# #=============role=============
# variable "ec2_role_arn" {
#   type        = string
#   description = "Specify role arn"
# }

#=============region=============
variable "aws_region" {
  type        = string
  description = "Specify your AWS region"
}

#=============security group=============
variable "sg_name" {
  type        = string
  description = "Specify name for security group"
}
variable "sg_desc" {
  type        = string
  description = "Specify description for security group"
}
variable "sg_ports_tcp" {
  type        = list(number)
  description = "Specify list of TCP ports for security group"
}
variable "sg_ports_udp" {
  type        = list(number)
  description = "Specify list of UDP ports for security group"
}

#=============autoscaling group/policy=============
variable "availability_zones" {
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  description = "Availability zones for load balancer and autoscaling group"
}
