resource "aws_vpc" "base" {
   cidr_block = "10.0.0.0/16"
    tags = {
        Name = "base-vpc"
    }
}

resource "aws_subnet" "base" {
  vpc_id            = aws_vpc.base.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "web-subnet"
  }
}
resource "aws_subnet" "name" {
  vpc_id            = aws_vpc.base.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "name-subnet"
  }
}