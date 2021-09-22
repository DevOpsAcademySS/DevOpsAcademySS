variable "instance_name_1" {
  description = "value of the name for the EC2 instance"
  type        = string
  default     = "Ubuntu_db_postgres"
}

variable "instance_name_2" {
  description = "value of the name for the EC2 instance"
  type        = string
  default     = "amazon_linux_ws_tomcat"
}

variable "owner_name" {
  description = "value for owner the EC2 instance"
  type        = string
  default     = "Denis Savchuk"
}

variable "project_name" {
  description = "Name of project"
  type        = string
  default     = "Geocitizen"
}

variable "key_name" {
  description = "name of the public key for instance"
  type        = string
  default     = "geocitizen_ubuntu_db"
}

