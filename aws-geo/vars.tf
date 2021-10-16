data "aws_secretsmanager_secret_version" "host_conf_key" {
  # Fill in the name you gave to your secret
  secret_id = "HOST_CONFIG_KEY"
}
locals {
  provision_creds = jsondecode(
    data.aws_secretsmanager_secret_version.host_conf_key.secret_string
  )
}
