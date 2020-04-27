provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "frontend" {
  availability_zone      = "${var.us-east-zones[count.index]}"
  ami                    = "ami-0ec0d1ef4e9493fa5"
  instance_type          = "t2.micro"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  }
