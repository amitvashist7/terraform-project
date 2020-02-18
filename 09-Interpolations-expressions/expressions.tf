provider "aws" {
  access_key = "XXX1"
  secret_key = "XXX2"
  region     = "us-east-2"
}

provider "aws" {
  alias      = "us-west-1"
  access_key = "XXX1"
  secret_key = "XXX2"
  region     = "us-east-2"
}

variable "us-east-zones" {
  default = ["us-east-2a", "us-east-2b"]
}

variable "us-west-zones" {
  default = ["us-east-2a", "us-east-2c"]
}

variable "multi-region-deployment" {
  default = true
}

variable "environment-name" {
  default = "Terraform-demo"
}

resource "aws_instance" "frontend" {
  tags = {
    Name = "${join("-",list(var.environment-name, "frontend"))}"
  }

  depends_on        = ["aws_instance.backend"]
  availability_zone = "${var.us-east-zones[count.index]}"
  ami               = "ami-0fc20dd1da406780b"
  instance_type     = "t2.micro"
}

resource "aws_instance" "west_frontend" {
  tags = {
    Name = "${join("-",list(var.environment-name, "frontend"))}"
  }

  count             = "${var.multi-region-deployment ? 1 : 0}"
  depends_on        = ["aws_instance.west_backend"]
  provider          = "aws.us-west-1"
  ami               = "ami-0fc20dd1da406780b"
  availability_zone = "${var.us-west-zones[count.index]}"
  instance_type     = "t2.micro"
}

resource "aws_instance" "backend" {
  tags = {
    Name = "${join("-", list(var.environment-name, "backend"))}"
  }

  count             = 2
  availability_zone = "${var.us-east-zones[count.index]}"
  ami               = "ami-0fc20dd1da406780b"
  instance_type     = "t2.micro"
}

resource "aws_instance" "west_backend" {
  tags = {
    Name = "${join("-", list(var.environment-name, "backend"))}"
  }

  provider          = "aws.us-west-1"
  ami               = "ami-0fc20dd1da406780b"
  count             = "${var.multi-region-deployment ? 2 : 0}"
  availability_zone = "${var.us-west-zones[count.index]}"
  instance_type     = "t2.micro"
}

output "frontend_ip" {
  value = "${aws_instance.frontend.public_ip}"
}

output "backend_ips" {
  value = "${aws_instance.backend.*.public_ip}"
}

output "west_frontend_ip" {
  value = "${aws_instance.west_frontend.*.public_ip}"
}

output "west_backend_ips" {
  value = "${aws_instance.west_backend.*.public_ip}"
}
