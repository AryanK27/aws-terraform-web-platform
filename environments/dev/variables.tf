variable "project_name" {
    type = string
    default = "aws_terraform_web_platform"
  description = "This is the Project Name"
}

variable "environment" {
    type = string
    default = "dev"
    description = "This is the environment name"
  
}

variable "aws_region" {
    type = string
  default = "ap-south-1"
  description = "This is the aws Region"
}

variable "vpc_cidr" {
    type = string
  default = "10.0.0.0/16"
  description = "This is the vpc cidr"
}

variable "allowed_ssh_cidr" {
  type = string
  description = "This is the allowed ssh CIDR"#allowed_ssh_cidr defines which IP address is allowed to access your EC2 instance through SSH (port 22)
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "This is the Instance Type"
  
}

