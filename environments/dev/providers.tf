terraform {
    required_version = ">=1.10.0"  #specfies which terraform CLI version are acceptable 
  required_providers {
    aws = {
      source  = "hashicorp/aws" #from which source 
      version = "~> 6.0"   #~> 6.0 allows Terraform to select compatible AWS provider versions from the 6.x series, but not 7.x.
  }
}
}

#Configure the AWS Provider

provider "aws" {
  region  = "ap-south-1"
}