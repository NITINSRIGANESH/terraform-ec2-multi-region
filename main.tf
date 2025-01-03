resource "aws_instance" "example_us_east_1" {
  provider = aws.us-east-1
  ami      = "ami-0c02fb55956c7d316"  # Update AMI ID or other parameters
  instance_type = "t2.micro"
}

