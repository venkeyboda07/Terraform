variable "vpc_id" {
    description = "The ID of the VPC where the security group will be created."
    type        = string
    default = "vpc-0333ffd8edd900aa6"
}

data "aws_vpc" "selected" {
    id = var.vpc_id
}
resource "aws_subnet" "web"  {
    vpc_id = data.aws_vpc.selected.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-south-1a"
    tags = {
        Name = "web-subnet"
    }
  
}