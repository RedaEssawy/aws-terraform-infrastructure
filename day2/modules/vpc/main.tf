
# this resource block will create a VPC 
resource "aws_vpc" "day2_vpc" {
    cidr_block = var.vpc_varaibles["cidr"]  
    region = var.vpc_varaibles["region"]
    tags = {
        Name = var.vpc_varaibles["vpc_name"]
    }
  
}
# this resource block will create a public subnet
resource "aws_subnet" "public_subnet" {
    vpc_id            = aws_vpc.day2_vpc.id
    cidr_block        = var.vpc_varaibles["public_subnet_cidr"]
    region = var.vpc_varaibles["region"]
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.vpc_varaibles["vpc_name"]}_public_subnet"
    }
  
}
# this resource block will create a route table for public subnet
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.day2_vpc.id
    region = var.vpc_varaibles["region"]
    tags = {
        Name = "${var.vpc_varaibles["vpc_name"]}_public_rt"
    }
  
}
# this resource block will create a route to internet gateway for public subnet
resource "aws_route" "public_rt_route" {
    route_table_id         = aws_route_table.public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.day2_igw.id
    region = var.vpc_varaibles["region"]
  
}
# this resource block will associate the public subnet with the public route table
resource "aws_route_table_association" "public_subnet_association" {
    subnet_id      = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_rt.id
    region = var.vpc_varaibles["region"]
  
}
# this resource block will create a private subnet
resource "aws_subnet" "private_subnet" {
    vpc_id            = aws_vpc.day2_vpc.id
    cidr_block        = var.vpc_varaibles["private_subnet_cidr"]
    region = var.vpc_varaibles["region"]
    map_public_ip_on_launch = false
    tags = {
        Name = "${var.vpc_varaibles["vpc_name"]}_private_subnet"
    }
  
}
# this resource block will create a route table for private subnet
resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.day2_vpc.id
    region = var.vpc_varaibles["region"]

    tags = {
        Name = "${var.vpc_varaibles["vpc_name"]}_private_rt"
    }
  
}
# this resource block will create a route to NAT gateway for private subnet
resource "aws_route" "private_rt_route" {
    route_table_id         = aws_route_table.private_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_nat_gateway.ngw.id
    region = var.vpc_varaibles["region"]
  
}
# this resource block will associate the private subnet with the private route table
resource "aws_route_table_association" "private_subnet_association" {
    subnet_id      = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private_rt.id
    region = var.vpc_varaibles["region"]  
}


# this resource block will create an internet gateway
resource "aws_internet_gateway" "day2_igw" {
    vpc_id = aws_vpc.day2_vpc.id
    region = var.vpc_varaibles["region"]
    tags = {
        Name = "${var.vpc_varaibles["vpc_name"]}_igw"
    }
  
}
# this resource block will create a NAT gateway
resource "aws_nat_gateway" "ngw" { 
    allocation_id = aws_eip.nat_eip.id
    subnet_id     = aws_subnet.public_subnet.id
    region = var.vpc_varaibles["region"]
    tags = {
        Name = "${var.vpc_varaibles["vpc_name"]}_nat_gateway"
    }
}
# this resource block will create an elastic IP for NAT gateway
resource "aws_eip" "nat_eip" {
    
    region = var.vpc_varaibles["region"]

  

}


