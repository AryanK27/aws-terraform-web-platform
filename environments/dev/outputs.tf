output "project_name" {
    description = "Name of the Project"
  value = var.project_name
}

output "environment" {
    description = "Name of the Environement"
    value = var.environment
  
}

output "aws_region" {
    description = "This is the Region"
    value = var.aws_region
  
}

output "vpc_cidr" {
  description = "This is the VPC CIDR"
  value = var.vpc_cidr
}