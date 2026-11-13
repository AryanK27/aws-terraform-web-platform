module "vpc" {
  source       = "../../modules/vpc"
  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
  environment  = var.environment

}

module "security" {
  source            = "../../modules/security"
  vpc_id            = module.vpc.vpc_id
  project_name      = var.project_name
  environment       = var.environment
  allowed_ssh_cidr  = var.allowed_ssh_cidr
  allowed_http_cidr = var.allowed_http_cidr

}

module "compute" {
  source            = "../../modules/compute"
  subnet_id         = module.vpc.public_subnet[0]
  security_group_id = module.security.aws_security_group
  instance_type     = var.instance_type
  user_data = templatefile("../../modules/compute/user_data.sh", {
    index_html = file("../../app/index.html")
  })
instance_profile_name = module.iam.instance_profile_name

}



#This is for IAM ROle attaching to the EC2

module "iam" {
  source = "../../modules/iam"

  aws_role_name = "${var.project_name}-${var.environment}-ec2-role"
  bucket_arn = module.s3.bucket_arn

  
}



module "s3" {

  source = "../../modules/s3"

  bucket_name = "${replace(var.project_name, "_", "-")}-${var.environment}-app-bucket-2533543"
  
}