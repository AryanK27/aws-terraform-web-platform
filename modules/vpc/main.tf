resource "aws_vpc" "main_vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
      Name="${var.project_name}-${var.environment}-vpc"
    }
  
}

data "aws_availability_zones" "available" {
  state="available"
  
}

resource "aws_subnet" "public" {
  count=2
   vpc_id = aws_vpc.main_vpc.id
   cidr_block = var.public_subnets[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
     map_public_ip_on_launch = true

     tags = {
       Name="${var.project_name}-${var.environment}-public-${count.index+1}"
     }
  
}


resource "aws_subnet" "private_subnets" {

  count=2
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name="${var.project_name}-${var.environment}-private-${count.index+1}"
  }
  
}