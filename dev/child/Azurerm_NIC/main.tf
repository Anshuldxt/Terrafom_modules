terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
}

resource "azurerm_network_interface" "nic_dev" {

  for_each = var.nic_dev

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  ip_configuration {

    name                          = each.value.ip_confi_name
    private_ip_address            = each.value.private_ip_address
    private_ip_address_allocation = each.value.private_ip_address_allocation
    subnet_id                     = data.azurerm_subnet.subnet_dev[each.key].id
  }
}

data "azurerm_subnet" "subnet_dev" {
  for_each = var.nic_dev

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name

}