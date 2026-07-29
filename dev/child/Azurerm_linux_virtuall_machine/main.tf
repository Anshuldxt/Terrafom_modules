terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
}


resource "azurerm_linux_virtual_machine" "example" {

  for_each = var.vm_dev

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size


  disable_password_authentication = false

  admin_username = each.value.admin_username
  admin_password = each.value.admin_password

  network_interface_ids = [data.azurerm_network_interface.nic_dev[each.key].id]

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type

  }

  source_image_reference {

    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }

}

data "azurerm_network_interface" "nic_dev" {

  for_each = var.vm_dev

  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name

}

