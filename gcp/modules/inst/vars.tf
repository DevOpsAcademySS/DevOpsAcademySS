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
