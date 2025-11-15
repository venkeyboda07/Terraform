resource "aws_instance" "base" {
    for_each = {
        server1 = "ami-0b09627181c8d5778"
        server2 = "ami-0f918f7e67a3323f0"

    } 
    ami = each.value
    instance_type = "t2.micro"
    tags = {
        Name = each.key
    }
}


#Example 1: Using for_each with a Set of Strings


resource "aws_iam_user" "the_accounts" {
  for_each = toset(["Todd", "James", "Alice", "Dottie"])
  name     = each.key
}


#Example 2: Using for_each with a Map


resource "azurerm_resource_group" "rg" {
  for_each = {
    a_group       = "eastus"
    another_group = "westus2"
  }
  name     = each.key
  location = each.value
}


#Example 3: Using for_each with a Map of Objects (Complex Attributes)

locals {
  instances = {
    dev1 = { instance_type = "t2.micro", ami_id = "ami-dev1" }
    dev2 = { instance_type = "t3.micro", ami_id = "ami-dev2" }
    dev3 = { instance_type = "t3.micro", ami_id = "ami-dev3" }
  }
}

resource "aws_instance" "this" {
  for_each      = local.instances
  instance_type = each.value.instance_type
  ami           = each.value.ami_id
  tags = {
    Name = each.key
  }
}


#Example 4: Using for_each with Modules

module "bucket" {
  for_each = toset(["assets", "media"])
  source   = "./publish_bucket"
  name     = "${each.key}_bucket"
}


#Example 5: Conditional Creation with for_each



locals {
  users = {
    alice = "admin"
    bob   = "user"
    carol = "admin"
  }
}

resource "aws_iam_user" "admins" {
  for_each = { for k, v in local.users : k => v if v == "admin" }
  name     = each.key
}
