remote_state {
  backend = "gcs"

  config = {
    bucket = "mybucket112133311"
    prefix = "${path_relative_to_include()}/terraform.tfstate"
    project = "focused-evening-327612"
    location = "us-central1"
  }
}