output "vpc_id" {
    description = "ID of the created vpc"
    value = aws_vpc.main_vpc.id
  
}

output "vpc_cidr" {
    description = "CIDR of the created vpc"
    value = aws_vpc.main_vpc.cidr_block
  
}


output "public_subnet" {
    value = aws_subnet.public_subnets[*].id
  
}

output "private_sutnet" {
    value = aws_subnet.private_subnets[*].id
  
}