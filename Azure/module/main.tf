terraform {
#  required_providers {
#    azurerm = {
#      source  = "registry.terraform.io/hashicorp/azurerm"
#      version = "~>2.0"
#    }
#  }
  backend "local" {
    path = "/var/lib/jenkins/scripts/tfcvpc/azure/module/terraform.tfstate"
  }
}

provider "azurerm" {
  version = "~>2.0"
  features {}
}

module "net" {
  source                = "../networking"
  az_rg                 = "dev301"
  az_location           = "centralindia"
  my_vpc_name           = "dev301_vpc"
  my_vpc_cidr           = ["192.168.0.0/16"]
  my_vpc_subnet_name    = "dev301_subnet"
  my_vpc_subnet_cidr    = "192.168.1.0/24"
  my_public_ip_name     = "dev301_pub_ip"
  my_public_ip_type     = "Dynamic"
  my_nsg_name           = "dev301_nsg"
  my_nic_name           = "dev301_nic"
  my_vm_private_ip_type = "Dynamic"
  my_numbers_vm         = "2"
  #  my_vpc_id             = module.net.my_vpc_id1
}

module "compu" {
  source        = "../compute"
  my_vm_loc     = "centralindia"
  my_numbers_vm = "2"
  my_rg_name    = module.net.my_rg_name
  my_nic_id     = module.net.my_nic
}
