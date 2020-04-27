provider "aws" {       
  region = "us-east-2" 
}                      

variable "key_name" {
  default = "k8s-demo-vmware-keypair"
}

variable "ami" {
  default = "ami-0653e888ec96eab9b"
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
  default = "sg-05361583173f5af76"
}

variable "instance_count" {
  default = 2
}

variable "instance_tags" {
  type = "list"
  default = ["Terraform-1", "Terraform-2"]
}

