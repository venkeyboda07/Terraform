# create a vpc

resource "aws_vpc" "base" {
  cidr_block           = var.network_info.cidr_block
  enable_dns_hostnames = var.network_info.enable_dns_hostnames
  tags = {
    Name = var.network_info.name
  }





}

resource "aws_subnet" "subnets" {
  count             = length(var.subnets_info)
  vpc_id            = aws_vpc.base.id
  cidr_block        = var.subnets_info[count.index].cidr_block
  availability_zone = var.subnets_info[count.index].availability_zone
  tags = {
    name = var.subnets_info[count.index].name
  }

  depends_on = [aws_vpc.base]

}
resource "aws_internet_gateway" "base" {
  vpc_id = aws_vpc.base.id
  tags = {
    name = "${var.network_info.name}-igw"
  }
  depends_on = [aws_vpc.base]
}


#  route tables for existing

data "aws_route_table" "default" {
  vpc_id = aws_vpc.base.id
  filter {
    name   = "association.main"
    values = ["true"]
  }
  depends_on = [aws_vpc.base]
}


resource "aws_route" "internet" {
  gateway_id             = aws_internet_gateway.base.id
  destination_cidr_block = local.anywhere
  route_table_id         = data.aws_route_table.default.id
  depends_on             = [aws_internet_gateway.base, data.aws_route_table.default]

}

