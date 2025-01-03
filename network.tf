resource "aws_vpc" "my_vpc" {
  cidr_block       = var.cidr_vpc
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "my_vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_subnet" "subnet_aws" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.cidr_subnet
  map_public_ip_on_launch = true            #Enable public IP assignment on launch.
  availability_zone = var.availability_zone
  
  tags = {
    Name = "my_subnet"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet_aws.id
  route_table_id = aws_route_table.rtb.id
}
