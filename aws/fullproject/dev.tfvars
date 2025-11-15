region = "ap-south-1"
network_info = {
    cidr_block = "10.1.0.0/16"
    enable_dns_hostnames = true
    name = "ntier"
}

subnets_info = [ {
    name = "web1"
    cidr_block = "10.1.1.0/24"
    availability_zone = "ap-south-1a"
}, {
    name = "web2"
    cidr_block = "10.1.2.0/24"
    availability_zone = "ap-south-1b"
},{
    name = "app1"
    cidr_block = "10.1.3.0/24"
    availability_zone = "ap-south-1a"
},{
    name = "app2"
    cidr_block = "10.1.4.0/24"
    availability_zone = "ap-south-1b"

},{
    name = "db1"
    cidr_block = "10.1.5.0/24"
    availability_zone = "ap-south-1a"
},{
    name = "db2"
    cidr_block = "10.1.6.0/24"
    availability_zone = "ap-south-1b"
}

]