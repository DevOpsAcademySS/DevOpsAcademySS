resource "null_resource" "command1" {
  provisioner "local-exec" {
    command = "rm -f geo.ip db.ip; echo $ip1 >> geo.ip; echo $ip2 >> db.ip"
    environment = {
      ip1 = aws_instance.amazon_linux.public_ip
      ip2 = aws_instance.ubuntu_server.public_ip
    }
  }
}
