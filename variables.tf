variable "region" {
  type = string
  default = "eu-north-1"
}


// AMIs
variable "amazon_linux-ami" {
  type = string
  default = "ami-0f0b4cb72cf3eadf3" # Amazom Linux 2 AMI, SSD Volume Type
}
variable "ubuntu_server-ami" {
  type = string
  default = "ami-0ff338189efb7ed37" # Ubuntu Server 20.04 LTS, SSD Volume Type
}


// instance_types
variable "amazon_linux-instance_type" {
  type = string
  default = "t3.micro"
}
variable "ubuntu_server-instance_type" {
  type = string
  default = "t3.micro"
}


// allowed_ports
variable "amazon_linux-allowed_ports" {
  type = list(number)
  default = [22, 53, 80, 443, 8080]
}
variable "ubuntu_server-allowed_ports" {
  type = list(number)
  default = [22, 53, 80, 443, 5432]
}
