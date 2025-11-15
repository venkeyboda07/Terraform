region = "ap-south-1"
network_info = {
  cidr_block           = "10.113.0.0/16"
  enable_dns_hostnames = true
  name                 = "ntier"
}


subnets_info = [{
  name              = "Web1"
  cidr_block        = "10.113.0.0/24"
  availability_zone = "ap-south-1a"

  }, {
  name              = "Web2"
  cidr_block        = "10.113.1.0/24"
  availability_zone = "ap-south-1b"
  }, {
  name              = "App1"
  cidr_block        = "10.113.2.0/24"
  availability_zone = "ap-south-1a"
  }, {
  name              = "App2"
  cidr_block        = "10.113.3.0/24"
  availability_zone = "ap-south-1b"
  }, {
  name              = "Db1"
  cidr_block        = "10.113.4.0/24"
  availability_zone = "ap-south-1a"
  }, {
  name              = "Db2"
  cidr_block        = "10.113.5.0/24"
  availability_zone = "ap-south-1b"
  }
]

