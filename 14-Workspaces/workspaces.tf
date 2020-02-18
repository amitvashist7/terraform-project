provider "aws" {
  region = "us-east-2"
}

locals {
  default_name = "${join("-", list(terraform.workspace, "example"))}"
}

resource "aws_instance" "example" {
  tags = {
    Name = "${local.default_name}"
  }

  ami           = "ami-08cec7c429219e339"
  instance_type = "t2.micro"
}
