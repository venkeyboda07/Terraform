resource "aws_instance" "web" {
  ami             = "ami-0f918f7e67a3323f0"
  instance_type   = "t2.micro"
  security_groups = ["karansecurity"]

  tags = {
    Name = "webserver"
  }
}


resource "security_groups" "launch-wizard-2" {
  # (resource arguments)
}