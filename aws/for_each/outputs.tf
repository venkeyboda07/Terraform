output "aws_instance_base_ami" {
  value = aws_instance.base[each.key]


}
