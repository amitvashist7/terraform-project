provider "aws" {       
  region = "us-east-2" 
}                      

variable "key_name" {
  default = "my-devops-key"
}

variable "ami" {
  default = "ami-0653e888ec96eab9b"
}

variable "pvt_key" {
  default = "/root/.ssh/amit-personal-aws.pem"
}

variable "us-east-zones" {
  default = ["us-east-2a", "us-east-2b"]
}

variable "sg-id" {
  default = "sg-043c096cfe64c558e"
}

variable "instance_count" {
  default = 2
}

variable "instance_tags" {
  type = "list"
  default = ["Terraform-1", "Terraform-2"]
}

