provider "aws" {
}


resource "aws_instance" "CentOS" {
  ami = "ami-011996ff98de391d1"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.web_security_group.id]
  tags = {
    Name = "CentOS"
  }
  key_name = "samirus"
}

resource "aws_security_group" "web_security_group" {
  name = "web_security_group"

  dynamic "ingress" {
    for_each = [
      "22",
      "8080"]
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [
        "0.0.0.0/0"]
    }
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}


data "template_file" "dev_hosts" {
  template = file("${path.module}/templates/dev_hosts.cfg")
  depends_on = [
    aws_instance.CentOS,
  ]
  vars = {
    api_centos = aws_instance.CentOS.public_ip
  }
}

resource "null_resource" "dev-hosts" {
  triggers = {
    template_rendered = data.template_file.dev_hosts.rendered
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.dev_hosts.rendered}' > inventory.txt"
  }
}