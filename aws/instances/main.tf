
module "security" {
  source = "../sg"
}

// aws_instance Amazon Linux 2
resource "aws_instance" "amazon_linux" {
  ami           = var.amazon_linux-ami
  instance_type = var.amazon_linux-instance_type
  tags          = { Name = "amazon linux" }
  vpc_security_group_ids = [module.security.amazon_linux-security]
}

