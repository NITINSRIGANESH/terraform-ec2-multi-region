resource "aws_instance" "first_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Use the correct AMI ID for your region
  instance_type = "t2.micro"
  tags = {
    Name = "First EC2 Instance"
  }
}

resource "aws_instance" "second_instance" {
  provider      = aws.second_region
  ami           = "ami-0c55b159cbfafe1f0"  # Use the correct AMI ID for your region
  instance_type = "t2.micro"
  tags = {
    Name = "Second EC2 Instance"
  }
}

resource "null_resource" "install_nginx_first" {
  depends_on = [aws_instance.first_instance]

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"  # Replace with the correct SSH user for your AMI
      private_key = file("~/.ssh/my-key.pem")  # Path to your private key
      host        = aws_instance.first_instance.public_ip
    }
  }
}

resource "null_resource" "install_nginx_second" {
  depends_on = [aws_instance.second_instance]

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"  # Replace with the correct SSH user for your AMI
      private_key = file("~/.ssh/my-key.pem")  # Path to your private key
      host        = aws_instance.second_instance.public_ip
    }
  }
}
