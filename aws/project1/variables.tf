variable "aws_region" {
  type    = string
  default = "ap-south-1"
}






variable "subnet_info" {
  type = list(object({
    name               = string
    availability_zones = string
    cidr_block         = string
  }))

  default = [
    {
      name               = "web1"
      availability_zones = "ap-south-1a"
      cidr_block         = "10.0.0.0/16"
    },
    {
      name               = "web2"
      availability_zones = "ap-south-1b"
      cidr_block         = "10.0.1.0/16"
    }
  ]
}
