terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta2"
    }
  }
}

provider "aws" {
  region = var.region
  # Optional: Uncomment the following line to use a specific profile
  default_tags {
    tags = {
      environment = "Dev"
      owner       = "Ops"
    }
  }
}