#resource "tls_private_key" "my_ssh_key" {
#  algorithm = var.my_ssh_algo
#  rsa_bits  = var.my_ssh_bits
#}
#output "tls_private_key" { value = tls_private_key.my_ssh_key.private_key_pem }

resource "azurerm_linux_virtual_machine" "myterraformvm" {
  count                 = var.my_numbers_vm
  name                  = "${var.my_vm_name}_${count.index}"
  location              = var.my_vm_loc
  resource_group_name   = var.my_rg_name
  network_interface_ids = [element(var.my_nic_id, count.index)]
  size                  = var.my_vm_size

  os_disk {
    name                 = "${var.my_disk_name}_${count.index}"
    caching              = "ReadWrite"
    storage_account_type = var.my_disk_type
  }

  source_image_reference {
    publisher = var.my_vm_type
    offer     = var.my_vm_flavor
    sku       = var.my_vm_sku
    version   = "16.04.201611220"
  }

  computer_name                   = "${var.my_vm_name}${count.index}"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }
}

resource "null_resource" "my_servers" {
  provisioner "local-exec" {
    command = "/var/lib/jenkins/scripts/tfcvpc/azure/module/shel.sh; ansible-playbook /var/lib/jenkins/scripts/tomcat-play.yaml; ansible-playbook /var/lib/jenkins/scripts/nginx-play.yaml"
  }
  depends_on = [azurerm_linux_virtual_machine.myterraformvm]
}
