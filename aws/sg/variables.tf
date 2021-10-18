/*
variable "region" {
  description = "AWS region for the S3 and DynamoDB"
  type = string
  default = "eu-north-1"
}
*/
// allowed_ports
// for Amazon Linux instance with tomcat
variable "amazon_linux-allowed_ports" {
  type = list(number)
  default = [22, 53, 80, 443, 8080]
}

