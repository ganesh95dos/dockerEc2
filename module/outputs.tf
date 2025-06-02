output "instance_public_ip" {
  value = aws_instance.docker-Deployment-Ansible[0].public_ip
}

output "instance_id" {
  value = aws_instance.docker-Deployment-Ansible[0].id
}

output "private_ip" {
  value = aws_instance.docker-Deployment-Ansible[0].private_ip
}