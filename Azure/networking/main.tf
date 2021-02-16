resource "azurerm_resource_group" "my_rg" {
  name     = var.az_rg
  location = var.az_location
}

resource "azurerm_virtual_network" "my_vpc" {
  name                = var.my_vpc_name
  address_space       = var.my_vpc_cidr
  location            = var.az_location
  resource_group_name = azurerm_resource_group.my_rg.name
}

resource "azurerm_subnet" "my_vpc_subnet" {
  name                 = var.my_vpc_subnet_name
  resource_group_name  = azurerm_resource_group.my_rg.name
  virtual_network_name = azurerm_virtual_network.my_vpc.name
  address_prefix       = var.my_vpc_subnet_cidr
}

resource "azurerm_public_ip" "my_public_ip" {
  count               = var.my_numbers_vm
  name                = "${var.my_public_ip_name}${count.index}"
  resource_group_name = azurerm_resource_group.my_rg.name
  location            = var.az_location
  allocation_method   = var.my_public_ip_type
}

resource "azurerm_network_security_group" "my_nsg" {
  name                = var.my_nsg_name
  location            = var.az_location
  resource_group_name = azurerm_resource_group.my_rg.name
}

resource "azurerm_network_security_rule" "my_security_rules" {
  count                       = length(var.inbound_ports)
  name                        = "Allowed_Port${count.index}"
  resource_group_name         = azurerm_resource_group.my_rg.name
  network_security_group_name = azurerm_network_security_group.my_nsg.name
  priority                    = "10${count.index}"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = element(var.inbound_ports, count.index)
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_network_interface" "my_nic" {
  count               = var.my_numbers_vm
  name                = "${var.my_nic_name}${count.index}"
  location            = var.az_location
  resource_group_name = azurerm_resource_group.my_rg.name

  ip_configuration {
    name                          = "nic_configuration_${count.index}_nicc"
    subnet_id                     = azurerm_subnet.my_vpc_subnet.id
    private_ip_address_allocation = var.my_vm_private_ip_type
    public_ip_address_id          = element(azurerm_public_ip.my_public_ip.*.id, count.index)
  }
}

resource "azurerm_network_interface_security_group_association" "my_nic_sg" {
  count                     = var.my_numbers_vm
  network_interface_id      = element(azurerm_network_interface.my_nic.*.id, count.index)
  network_security_group_id = azurerm_network_security_group.my_nsg.id
}

output "my_rg_name" {
  value = azurerm_resource_group.my_rg.name
}

output "my_nic" {
  value = azurerm_network_interface.my_nic.*.id
}

output "pub_ips" {
  value = azurerm_public_ip.my_public_ip.*.id
}
