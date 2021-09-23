variable "region" {
  default = "eu-north-1"
}
variable "ubuntu_ins" {
  default = "ami-0ff338189efb7ed37"
}
variable "amazon_lin_ins" {
    default = "ami-0f0b4cb72cf3eadf3"
  
}
variable "ins_type" {
  default = "t3.micro"
}
variable "allow_ports_web_server" {
  default = ["22", "8080"]
}
variable "allow_ports_db" {
  default = ["22", "5432"]
}
variable "key_name" {
  default = "geositizen"
}