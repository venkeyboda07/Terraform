

##resource "aws_instance" "base" {
 #ami           = "ami-0f918f7e67a3323f0"
  
  #
  #instance_type = "t2.micro"
  #count = 3
  #key_name                    = var.key_name
  
  #vpc_security_group_ids      = var.vpc_security_group_ids

  #tags = {
   # Name = var.instance_names[count.index]
 #}
#}




resource "aws_instance" "app_server" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"
  count         = length( ["app-server-a", "app-server-b", "app-server-c"])

  tags = {
    Name = ["app-server-51", "app-server-54", "app-server-69"][count.index]
  }
}


resource "null_resource" "configmap" {
  
  provisioner "remote-exec" {
    command = "apt update"
  }
}




resource "aws_instance" "eweb" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"
  key_name      = "terraform-key"

  tags = {
    Name = "web-server"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user" # or "ubuntu" for Ubuntu AMIs
    private_key = file("~/.ssh/id_rsa") # Adjust path to your private key
    host        = self.public_ip
  }

    provisioner "remote-exec" {
    inline = [
      
      "sudo apt install nginx -y",
      "sudo systemctl start nginx",
    ]
  }
}

