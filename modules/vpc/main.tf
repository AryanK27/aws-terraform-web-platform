#This is the main VPC

resource "aws_vpc" "main_vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
      Name="${var.project_name}-${var.environment}-vpc"
    }
  
}

#These are the availability Zones
data "aws_availability_zones" "available" {
  state="available"
  
}

#These are the public subnets 
resource "aws_subnet" "public_subnets" {
  count=2
   vpc_id = aws_vpc.main_vpc.id
   cidr_block = var.public_subnets[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
     map_public_ip_on_launch = true

     tags = {
       Name="${var.project_name}-${var.environment}-public-${count.index+1}"
     }
  
}

#These are private subnets 

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


#this is the internet gateway 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id  #attached vpc to the internet gateway

  tags = {
    Name="${var.project_name}-${var.environment}-igw"  #name of the internet gateway
  }
  
}

#Public Route table 

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name="${var.project_name}-${var.environment}-public_rt"
  }
  
}

resource "aws_route" "public_internet" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
  
}


resource "aws_route_table_association" "public" {

  count=2

  subnet_id = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public.id
  
}


#private route table

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name="${var.project_name}-${var.environment}-private_rt"
  }
  
}

resource "aws_route_table_association" "private" {
  count=2

  subnet_id = aws_subnet.private_subnets[count.index].id 
  route_table_id = aws_route_table.private.id  
}