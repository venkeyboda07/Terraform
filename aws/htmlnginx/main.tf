



resource "aws_instance" "web_server" {
  ami                    = "ami-0f918f7e67a3323f0" # Ubuntu AMI for your region
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  security_groups       = ["karansecurity"]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  # 1. Copy the local HTML file to the instance
  provisioner "file" {
    source      = "F:\\devops\\terraform\\stockton.html"                 # Local path
    destination = "/tmp/index.html"            # Remote path (temporary)
  }

  # 2. Install Nginx and move the HTML file into place
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install nginx -y",
      "sudo mv /tmp/index.html /var/www/html/index.html",
      "sudo chown www-data:www-data /var/www/html/index.html",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]
  }

  tags = {
    Name = "nginx-server"
  }
}


