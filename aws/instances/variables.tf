
// Amazon Linux 2
// AMI
variable "amazon_linux-ami" {
  type = string
  default = "ami-0f0b4cb72cf3eadf3" # Amazom Linux 2 AMI, SSD Volume Type
}

// instance_type
variable "amazon_linux-instance_type" {
  type = string
  default = "t3.micro"
}


/*
// Ubuntu Server
// AMI
variable "ubuntu_server-ami" {
  type = string
  default = "ami-0ff338189efb7ed37" # Ubuntu Server 20.04 LTS, SSD Volume Type
}

// instance_type
variable "ubuntu_server-instance_type" {
  type = string
  default = "t3.micro"
}
*/