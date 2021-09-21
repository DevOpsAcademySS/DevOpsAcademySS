variable "default_region" {
  default = "eu-north-1"
}

variable "redhat_ports" {
  type    = list(number)
  default = [22, 80, 443, 53] # 8080
}
variable "ubuntu_ports" {
  type    = list(number)
  default = [22, 80, 443, 53] # 5432
}
