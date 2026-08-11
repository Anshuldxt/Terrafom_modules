terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
}


resource "azurerm_network_security_group" "nsg" {

  for_each = var.nsg_dev

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "security_rule" {

    for_each = each.value.security_rules

    content {

      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol

      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range

      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix

      description = try(
        security_rule.value.description,
        null
      )
    }
  }
}


resource "azurerm_subnet_network_security_group_association" "nsg_association" {

  for_each = var.nsg_subnet_association

  subnet_id = data.azurerm_subnet.subnet[each.key].id

  network_security_group_id = azurerm_network_security_group.nsg[
    each.value.nsg_key
  ].id
}

data "azurerm_subnet" "subnet" {
  for_each = var.nsg_subnet_association

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}