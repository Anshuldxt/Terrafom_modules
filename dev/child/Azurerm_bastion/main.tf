terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
}



resource "azurerm_public_ip" "bastion" {

  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"
}


resource "azurerm_bastion_host" "bastion" {

  name                = var.bastion_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku = var.sku

  ip_configuration {

    name = "bastion-ip-config"

    subnet_id = data.azurerm_subnet.bastion.id

    public_ip_address_id = azurerm_public_ip.bastion.id
  }
}

data "azurerm_subnet" "bastion" {

  name                 = var.bastion_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}