resource "aws_vpc" "test-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "test-vpc"
  }
}

resource "aws_subnet" "test-public-1" {
  vpc_id                  = aws_vpc.test-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "test-public-1"
  }
}

resource "aws_subnet" "test-public-2" {
  vpc_id                  = aws_vpc.test-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "test-public-2"
  }
}


resource "aws_subnet" "test-public-3" {
  vpc_id                  = aws_vpc.test-vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "test-public-3"
  }
}


resource "aws_subnet" "test-priv-1" {
  vpc_id                  = aws_vpc.test-vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "test-priv-1"
  }
}


resource "aws_subnet" "test-priv-2" {
  vpc_id                  = aws_vpc.test-vpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "test-priv-2"
  }
}


resource "aws_subnet" "test-priv-3" {
  vpc_id                  = aws_vpc.test-vpc.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "test-priv-3"
  }
}

resource "aws_internet_gateway" "test-IGW" {
  vpc_id = aws_vpc.test-vpc.id
  tags = {
    Name = "test-IGW"
  }
}

resource "aws_route_table" "test-pub-RT" {
  vpc_id = aws_vpc.test-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-IGW.id
  }

  tags = {
    Name = "test-public-RT"
  }
}


resource "aws_route_table_association" "test-public-1-a" {
  subnet_id      = aws_subnet.test-public-1.id
  route_table_id = aws_route_table.test-pub-RT.id
}

resource "aws_route_table_association" "test-public-2-a" {
  subnet_id      = aws_subnet.test-public-2.id
  route_table_id = aws_route_table.test-pub-RT.id
}
resource "aws_route_table_association" "test-public-3-a" {
  subnet_id      = aws_subnet.test-public-3.id
  route_table_id = aws_route_table.test-pub-RT.id
}
