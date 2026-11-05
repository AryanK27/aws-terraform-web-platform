variable "subnet_id" {
    type = string  
}

variable "environment" {
    type = string
    default = "dev"
  
}

variable "project_name" {
    type = string
    default = "aws-terraform-web-platform"
  
}

variable "instance_type" {
    type = string
    default = "t3.micro"
  
}

variable "security_group_id" {
    type = string
  
}

variable "user_data" {
    type = string
  
}
