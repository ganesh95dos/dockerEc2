#need Key
resource "aws_key_pair" "dockerDeploymentKey" {
  key_name = "ec2-key-pair"
  public_key = file("ec2-key-pair.pub")
}

#need VPC
resource "aws_default_vpc" "default" {
  
}

#need security group
resource "aws_security_group" "dockerDeploymentSG" {
  name = "${var.env}-${var.dockerDeploymentSG}"
  description = "This is instance security group"
  vpc_id = aws_default_vpc.default.id

    ingress{
    from_port = 22 #use for SSH
    to_port = 22
    protocol = "tcp"
    cidr_blocks =["0.0.0.0/0"]
    description = "This is SSH Port"
    }

    ingress{
    from_port = 8000 #use for application
    to_port = 8000
    protocol = "tcp"
    cidr_blocks =["0.0.0.0/0"]
    description = "This is SSH Port"
    }

egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "This is outbound for all"
    }
}
#this is ec2 instance
resource "aws_instance" "docker-Deployment-Ansible" {
  count = var.instance_count

  depends_on = [ aws_security_group.dockerDeploymentSG, aws_key_pair.dockerDeploymentKey ]

  
  #need key 
  key_name = aws_key_pair.dockerDeploymentKey.key_name

  #configure VPC SG
  vpc_security_group_ids = [aws_security_group.dockerDeploymentSG.id]
  #define instance type
  instance_type = var.instance_type
  ami = var.ami
  

  #define storage
  root_block_device {
    volume_size = var.env =="prd" ? 20 : 10
    volume_type = "gp3"
  }
  
  tags = {
    Name = "${var.env}-${var.instanceName}"
  }
}
