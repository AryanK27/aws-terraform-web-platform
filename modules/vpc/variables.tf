variable "vpc_cidr" {
    type = string
    description = "This is in module in vpc CIDR Value"
    default = "10.0.0.0/16"
  
}

variable "project_name" {
    type = string
    description = "this is the project name in module inside vpc "
    default = "aws_terraform_web_platform"
  
}

variable "environment" {
    type = string
    description = "This is the inner module inner VPC environment name"
    default = "dev"
  
}

variable "public_subnets" {
    type = list(string)
    default = ["10.0.1.0/24",  "10.0.3.0/24"]
  
}

variable "private_subnet_cidr" {
  type = list(string)
  default = [ "10.0.2.0/24", "10.0.4.0/24"]
}