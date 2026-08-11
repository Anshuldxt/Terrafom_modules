module "azuerm_resource_group" {

  source = "../child/Azurerm_resource_group"

  RG_Dev = var.RG_Dev

}

module "azurerm_virtual_network" {

  source = "../child/Azurerm_virtual_network"

  Vnet_dev = var.Vnet_dev

  depends_on = [module.azuerm_resource_group]

}

module "azurerm_subnet" {
  source     = "../child/Azurerm_subnet"
  subnet_dev = var.subnet_dev
  depends_on = [module.azurerm_virtual_network]



}

module "azurerm_network_interface" {
  source     = "../child/Azurerm_NIC"
  nic_dev    = var.nic_dev
  depends_on = [module.azurerm_subnet]
}

module "azurerm_linux_virtual_machine" {
  source     = "../child/Azurerm_linux_virtuall_machine"
  vm_dev     = var.vm_dev
  depends_on = [module.azurerm_network_interface]

}

variable "RG_Dev" {}

variable "Vnet_dev" {}

variable "subnet_dev" {}

variable "nic_dev" {}

variable "vm_dev" {}

