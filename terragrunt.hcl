remote_state {
  backend = "gcs"

  config = {
    bucket = "mybucket1121333"
    prefix = "${path_relative_to_include()}/terraform.tfstate"
    project = "focused-evening-327612"
    location = "us-central1"
  }
}

terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

    env_vars = {
      TF_VAR_org_id =  "111111111111"
    }
  }
}


