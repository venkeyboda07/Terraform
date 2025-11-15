resource "aws_vpc" "nop" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "nop-vpc-dev"
  }
  lifecycle {
    prevent_destroy = false
  
  }
}


resource "aws_subnet" "public1" {

  vpc_id     = aws_vpc.nop.id
  cidr_block = "10.10.0.0/20"

  availability_zone = "ap-south-1a"

}

resource "aws_subnet" "public2" {

  cidr_block        = "10.10.0.0/20"
  availability_zone = "ap-south-1b"
  vpc_id            = aws_vpc.nop.id
}

resource "aws_subnet" "private1" {

  cidr_block        = "10.10.128.0/20"
  availability_zone = "ap-south-1a"
  vpc_id            = aws_vpc.nop.id
}

resource "aws_subnet" "private2" {

  cidr_block        = "10.10.144.0/20"
  availability_zone = "ap-south-1b"
  vpc_id            = aws_vpc.nop.id
}


resource "aws_internet_gateway" "nop" {



  tags_all = {
    "Name" = "project-igw"
  }
  vpc_id = aws_vpc.nop.id
}


resource "aws_route_table" "nop" {

  tags_all = {
    "Name" = "karan"
  }
  vpc_id = aws_vpc.nop.id


}


