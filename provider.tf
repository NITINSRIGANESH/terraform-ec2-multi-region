# Provider for US-East-1
provider "aws" {
  region  = "us-east-1"
  profile = "us-east-1"
}

resource "aws_instance" "example_us_east_1" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with a valid AMI ID for the US-East-1 region
  instance_type = "t2.micro"
  tags = {
    Name = "US-East-1-Instance"
  }
}

# Provider for Tokyo (AP-Northeast-1)
provider "aws" {
  region  = "ap-northeast-1"
  profile = "ap-northeast-1"
}

resource "aws_instance" "example_ap_northeast_1" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with a valid AMI ID for the AP-Northeast-1 region
  instance_type = "t2.micro"
  tags = {
    Name = "Tokyo-Instance"
  }
}
