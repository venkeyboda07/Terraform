variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the instance"
  type        = list(string)
  default     = ["sg-0d440496938da7f3f"]

}


variable "key_name" {
  description = "Name of the key pair to use for SSH access"
  type        = string
  default     = "karankey"

}



variable "create_instance" {
  description = "Flag to determine if the conditional instance should be created"
  type        = bool
  default     = true
}

