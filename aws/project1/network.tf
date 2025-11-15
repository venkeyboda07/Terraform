resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"


  tags = {
    Name = "main"
  }
}

#app subnet
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "ap-south-1a"
  cidr_block        = "10.0.0.0/24"

  tags = {
    name = "apps"
  }
   depends_on = [aws_vpc.main]
}



#app2 subnet 

resource "aws_subnet" "web2" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "ap-south-1b"
  cidr_block        = "10.0.1.0/24"

  tags = {
    name = "web2"
   
  }
   depends_on = [aws_vpc.main]
}


resource "aws_route_table" "base" {
  vpc_id = aws_vpc.main.id

  tags = {
    name = "new"
  }
 }
