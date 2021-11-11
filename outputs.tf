output "jenkins-agent-ip_address" {
  value = aws_instance.jenkins-agent.public_ip
}
