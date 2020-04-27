provider "aws" {
  access_key = "Access Key"
  secret_key = "Secrey Key"
  region     = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = "ami-XXXXXXXX"
  instance_type = "t2.micro"
}
