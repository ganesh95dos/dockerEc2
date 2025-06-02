variable "env" {
    type = string
    description = "This is Environment Name"
  
}

variable "dockerDeploymentSG" {
    type = string
  #  description = "This is Automate Docker DeploymentS"
  
}

variable "instance_type" {
    type = string
   # description = "This is Automate Docker DeploymentS"
  
}

variable "instance_count" {
  type = number
}

variable "ami" {
    type = string
  #  description = "This is Automate Docker DeploymentS"
  
}

variable "instanceName" {
    type = string
    description = "This is Automate Docker DeploymentS"
  
}

variable "ssh_user" {
    type = string
    description = "This is Automate Docker DeploymentS"
}

variable "private_key_path" {
  description = "Path to private key directory"
  type        = string
}

variable "private_key" {
  description = "Private key filename"
  type        = string
}