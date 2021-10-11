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
variable "sg_ports" {
  type = list(number)
  #default = [22, 80, 443, 53] # 8080
  description = "Specify list of ports for security group"
}
