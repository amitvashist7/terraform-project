variable "az_rg" {}

variable "az_location" {
  default = "centralindia"
}

variable "my_vpc_name" {}

variable "my_vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "my_vpc_subnet_name" {}

variable "my_vpc_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "my_public_ip_name" {}

variable "my_public_ip_type" {
  default = "dynamic"
}

variable "my_nsg_name" {}

variable "my_nic_name" {}

variable "my_vm_private_ip_type" {
  default = "dynamic"
}

variable "my_numbers_vm" {}

variable "inbound_ports" {
  type    = list(string)
  default = ["22", "80", "8080"]
}
