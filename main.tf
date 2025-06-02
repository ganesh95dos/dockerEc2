module "docker-Deployment-Ansible" {
    source = "./module"
    env = "prod"
    #bucket_name = "my-own-infra-app-bucket"
    dockerDeploymentSG = "dockerDeploymentSG"
    instance_type = "t2.micro"
    instance_count = 1
    ami = "ami-0e35ddab05955cf57" #ubuntu
    instanceName = "docker-Deployment-Anssible"
    ssh_user = "ubuntu"
    private_key_path = "/home/ganesh/Downloads/ganesh/terafrom/dockerEc2"
    private_key      = "ec2-key-pair"

}

resource "null_resource" "docker-Deployment-Ansible" {
  depends_on = [module.docker-Deployment-Ansible]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./ec2-key-pair")
    host = module.docker-Deployment-Ansible.instance_public_ip  
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'SSH is Getting Ready for ansible'"
    ]
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i '${module.docker-Deployment-Ansible.instance_public_ip},' -u ubuntu --private-key ./ec2-key-pair instalDocAnsi.yml"
  }                         
}