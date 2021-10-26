include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules//inst"
}

inputs = {
  fw_name = "my-ports-5"
  fw_ports = ["22", "80", "443", "8080-8081"]
  instance_name= "my-not-slave"
  instance_type="e2-medium"
  instance_image="ubuntu-2004-focal-v20210927"
  network_name="my-net"
  gcp_proj_name = "my-proj"
  gcp_region = "us-central2"
  gcp_zone = "us-central2-b"
  trgt_tags = ["mu-ports-5"]
}
