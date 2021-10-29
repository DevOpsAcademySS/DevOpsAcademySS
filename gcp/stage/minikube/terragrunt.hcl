include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules//inst"
}

inputs = {
  fw_name = "my6-ports"
  fw_ports = ["22","80"]
  instance_name= "minikube-1"
  instance_type="e2-medium"
  instance_image="ubuntu-2004-focal-v20210927"
  network_name="default"
  gcp_proj_name = "my-proj"
  gcp_region = "us-central1"
  gcp_zone = "us-central1-a"
  trgt_tags = ["my-ports-6"]
}
