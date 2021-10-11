#=============rds instance=============
variable "db_identifire" {
  type        = string
  description = "Specify DB identifier"
}

variable "db_name" {
  type        = string
  description = "Specify name of DB"
}

variable "inst_type" {
  type        = string
  description = "Specify type of DB instance (e.g. db.t2.micro)"
}

variable "db_user" {
  type        = string
  description = "Specify userrname of DB"
}

variable "db_pass" {
  type        = string
  description = "Specify password of DB"
}

variable "pub_access" {
  type = string
  #   default     = "true"
  description = "Specify public accsess of DB instance (true or false)"
}


#=============region=============
variable "aws_region" {
  type        = string
  description = "Specify your AWS region"
}

# #=============role=============
# variable "rds_role_arn" {
#   type        = string
#   description = "Specify AWS RDS role arn"
# }
