
variable "region" {
  type = string
  default = "eu-north-1"
}


// AMIs
variable "ubuntu_server-ami" {
  type = string
  default = "ami-0ff338189efb7ed37" # Ubuntu Server 20.04 LTS, SSD Volume Type
}


// instance_types
variable "ubuntu_server-instance_type" {
  type = string
  default = "t3.micro"
}


// allowed_ports
variable "web_server-allowed_ports" {
  type = list(number)
  default = [22, 53, 80, 443, 8080]
}
