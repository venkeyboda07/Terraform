resource "aws_vpc" "base" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    name = "nop5"

  }
}
# app-1 subnet
resource "aws_subnet" "app1" {
  vpc_id            = aws_vpc.base.id
  availability_zone = "ap-south-1a"
  cidr_block        = "10.0.0.0/24"
  tags = {
    name = "app1"
  }

  depends_on = [aws_vpc.base]
}


#app-2 subnetcheck "name" {

resource "aws_subnet" "app2" {
  vpc_id            = aws_vpc.base.id
  availability_zone = "ap-south-1b"
  cidr_block        = "10.0.1.0/24"
  tags = {
    name = "app2"
  }
  depends_on = [aws_vpc.base]
}

#db-1 subnet
resource "aws_subnet" "db1" {
  vpc_id            = aws_vpc.base.id
  availability_zone = "ap-south-1a"
  cidr_block        = "10.0.2.0/24"
  tags = {
    name = "db1"
  }
  depends_on = [aws_vpc.base]
}

#db-2 subnet
resource "aws_subnet" "db2" {
  vpc_id            = aws_vpc.base.id
  availability_zone = "ap-south-1b"
  cidr_block        = "10.0.4.0/24"
  tags = {
    name = "db2"
  }
  depends_on = [aws_vpc.base]
}