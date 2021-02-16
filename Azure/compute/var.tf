variable "my_ssh_algo" {
  default = "RSA"
}

variable "my_ssh_bits" {
  default = "4096"
}

variable "my_vm_name" {
  default = "dev301vm"
}

variable "my_vm_loc" {}

variable "my_rg_name" {}

variable "my_nic_id" {}

variable "my_vm_size" {
  default = "Standard_B1s"
}

variable "my_disk_name" {
  default = "dev"
}

variable "my_disk_type" {
  default = "Premium_LRS"
}
#Details -> az vm image list --offer UbuntuServer --all -o table

variable "my_vm_type" {
  default = "Canonical"
}

variable "my_vm_flavor" {
  default = "UbuntuServer"
}

variable "my_vm_sku" {
  default = "16.04-LTS"
}

variable "my_numbers_vm" {}
