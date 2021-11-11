#==========instance==========
variable "instance_name" {
  type        = string
  description = "Specify name of your GCP instance"
}

variable "instance_type" {
  type        = string
  description = "Specify machine type of your GCP instance"
}

variable "instance_image" {
  type = string
  #default = "debian-cloud/debian-9"
  description = "Specify image of your GCP instance"
}

variable "disk_size" {
  type = number
  default = 10
  description = "Specify size of disk"
}

#==========network==========
variable "network_name" {
  type = string
  #default     = "terraform-network"
  description = "Specify name of network"
}

#==========firewall==========
variable "fw_name" {
  type        = string
  description = "Specify name of firewall"
}
variable "fw_ports" {
  type        = list(string)
  description = "Specify list of ports for firewall"
}

variable "trgt_tags" {
  type        = list(string)
  description = "Specify list of instance tags indicating sets of instances located in the network that may make network connections as specified in allowed[]."
}

#==========provider==========
variable "gcp_proj_name" {
  type        = string
  description = "Specify Project name"
}

variable "gcp_region" {
  type        = string
  description = "Specify your GCP region"
}

variable "gcp_zone" {
  type        = string
  description = "Specify your GCP zone"
}
