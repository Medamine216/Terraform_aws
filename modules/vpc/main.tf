# create a VPC
resource "aws_vpc" "myvpc" {
    cidr_block = "${var.vpc_cidr_block}"
    tags = {
        Name = "${var.vpc_name}"
    }
  
}

# Create a public subnet
resource "aws_subnet" "PublicSubnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "${var.public_subnet_cidr_block}"
}

# Create a private subnet
resource "aws_subnet" "PrivateSubnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "${var.private_subnet_cidr_block}"
}

# Create IGW

resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.myvpc.id
}

# Route table for public subnet
resource "aws_route_table" "PublicRT" {
    vpc_id = aws_vpc.myvpc.id
    route { 
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW.id
    }
}

# Route table association public subnet
resource "aws_route_table_association" "PublicRtAssociation" {
    subnet_id = aws_subnet.PublicSubnet.id
    route_table_id = aws_route_table.PublicRT.id
  
}