include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules//rds"
}

inputs = {
  # rds_role_arn = ""
  db_identifire = "my-db"
  db_name = "demo_1"
  inst_type = "db.t2.micro"
  db_user = "myusername"
  db_pass = "password"
  pub_access  = true
  aws_region = "eu-central-2"
}