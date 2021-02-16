provider "aws" {       
  region = "us-east-2" 
}                      

variable "key_name" {
  default = "terraform-k8s-key"
}

variable "ami" {
  default = "ami-0ebc8f6f580a04647"
}


variable "ec2type" {
  default = "t2.medium"
}

variable "pvt_key" {
  default = "/root/.ssh/amit-personal-aws.pem"
}

variable "us-east-zones" {
  default = ["us-east-2a", "us-east-2b"]
}

variable "sg-id" {
  default = "sg-04782317b2f3efd8f"
}

variable "instance_count" {
  default = 3
}

variable "instance_tags" {
  type = "list"
  default = ["Terraform-1", "Terraform-2"]
}

