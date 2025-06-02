module "dockerDeployment" {
    source = "./module"
    env = "prod"
    #bucket_name = "my-own-infra-app-bucket"
    dockerDeploymentSG = "dockerDeploymentSG"
    instance_type = "t2.micro"
    instance_count = 1
    ami = "ami-0e35ddab05955cf57" #ubuntu
    instanceName = "docker-Deployment-Anssible"

}
