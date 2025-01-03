provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "second_region"
  region = "us-west-2"
}
