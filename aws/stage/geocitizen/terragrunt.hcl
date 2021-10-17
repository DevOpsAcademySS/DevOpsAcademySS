include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules//app"
}

inputs = {
  # ec2_role_arn = ""
  instance_name = "myinstance"
  instance_ami = "ami-05f7491af5eef733a"
  instance_type = "t2.micro"
  ssh_key_name = "sshkeyname"
  tag_name = "tagname"
  aws_region = "eu-central-1"
  sg_name = "security_group_name"
  sg_desc = "security group name desc"
  sg_ports_tcp = [22, 80, 443, 53, 8030]
  sg_ports_udp = [ 8030 ]
}