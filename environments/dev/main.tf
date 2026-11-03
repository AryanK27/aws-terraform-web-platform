module "vpc" {
    source = "../../modules/vpc"
    vpc_cidr = var.vpc_cidr
    project_name = var.project_name
    environment = var.environment
  
}

module "security" {
    source = "../../modules/security"
    vpc_id =     module.vpc.vpc_id
    project_name = var.project_name
    environment = var.environment
    allowed_ssh_cidr = var.allowed_ssh_cidr
    allowed_http_cidr = var.allowed_http_cidr
  
}



