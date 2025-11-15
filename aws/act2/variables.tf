variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "default_tags" {
  type = map(string)
  default = {
    " Env"      = "Dev"
    "Createdby" = "Terraform"

  }
}
variable "network_info" {
  type = object({
    name                 = string
    cidr_block           = string
    enable_dns_hostnames = bool

  })
  default = {
    name       = "ntier"
    cidr_block = "10.113.0.0/16"

    enable_dns_hostnames = true
  }
}

variable "subnets_info" {
  type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string


  }))
  default = [{
    name              = "web1"
    availability_zone = "ap-south-1a"
    cidr_block        = "10.113.0.0/24"

    }, {
    name              = "web2"
    availability_zone = "ap-south-1b"
    cidr_block        = "10.113.1.0/24"
    },
  ]

}