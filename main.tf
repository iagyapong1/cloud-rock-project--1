

#Create vpc
resource "aws_vpc" "CR-project-1-vpc" {
  cidr_block       = var.cidr-for-vpc
  instance_tenancy = "default"

  tags = {
    Name = "CR-project-1-vpc"
  }
}

#Create private subnet
resource "aws_subnet" "CR-private-sub-1" {
  vpc_id     = aws_vpc.CR-project-1-vpc.id
  cidr_block = var.cidr-for-private-sub1

  tags = {
    Name = "CR-private-sub-1"
  }
}

resource "aws_subnet" "CR-private-sub-2" {
  vpc_id     = aws_vpc.CR-project-1-vpc.id
  cidr_block = var.cidr-for-public-sub2

  tags = {
    Name = "CR-private-sub-2"
  }
}

# Create Public subnet
resource "aws_subnet" "CR-public-sub-1" {
  vpc_id     = aws_vpc.CR-project-1-vpc.id
  cidr_block = var.cidr-for-public-sub1

  tags = {
    Name = "CR-public-sub-1"
  }
}

resource "aws_subnet" "CR-public-sub-2" {
  vpc_id     = aws_vpc.CR-project-1-vpc.id
  cidr_block = var.cidr-for-public-sub2

  tags = {
    Name = "CR-public-sub-2"
  }
}

#Route table private
resource "aws_route_table" "CR-Private-route-table" {
  vpc_id = aws_vpc.CR-project-1-vpc.id


  tags = {
    Name = "CR-Private-route-table"
  }
}


#Route table public
resource "aws_route_table" "CR-Public-route-table" {
  vpc_id = aws_vpc.CR-project-1-vpc.id


  tags = {
    Name = "CR-Public-route-table"
  }
}

#Route table association
resource "aws_route_table_association" "CR-Private-route-table-association-1" {
  subnet_id      = aws_subnet.CR-private-sub-1.id
  route_table_id = aws_route_table.CR-Private-route-table.id
}

resource "aws_route_table_association" "CR-Private-route-table-association-2" {
  subnet_id      = aws_subnet.CR-private-sub-2.id
  route_table_id = aws_route_table.CR-Private-route-table.id
}

resource "aws_route_table_association" "CR-Public-route-table-association-1" {
  subnet_id      = aws_subnet.CR-public-sub-1.id
  route_table_id = aws_route_table.CR-Public-route-table.id
}

resource "aws_route_table_association" "CR-Public-route-table-association-2" {
  subnet_id      = aws_subnet.CR-public-sub-2.id
  route_table_id = aws_route_table.CR-Public-route-table.id
}

#Internet Gateway 

resource "aws_internet_gateway" "CR-IGW" {
  vpc_id = aws_vpc.CR-project-1-vpc.id

  tags = {
    Name = "CR-IGW"
  }
}
#Associate internet gateway with public route table
resource "aws_route" "CR-Public-route-table" {
  route_table_id            =  aws_route_table.CR-Public-route-table.id
  gateway_id                = aws_internet_gateway.CR-IGW.id
  destination_cidr_block    = "0.0.0.0/0"
  }