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

  source = "../child/Azurerm_linux_virtuall_machine"

  vm_dev = var.vm_dev

  ssh_public_key = var.ssh_public_key


  depends_on = [module.azurerm_network_interface]
}

module "azurerm_nsg" {

  source = "../child/Azurerm_NSG"

  nsg_dev = var.nsg_dev

  nsg_subnet_association = var.nsg_subnet_association

  depends_on = [module.azurerm_subnet]
}


module "azurerm_bastion" {

  source = "../child/Azurerm_bastion"

  bastion_name        = var.bastion_name
  public_ip_name      = var.public_ip_name
  location            = var.bastion_location
  resource_group_name = var.bastion_resource_group_name

  virtual_network_name = var.bastion_virtual_network_name
  bastion_subnet_name  = var.bastion_subnet_name

  sku = var.bastion_sku


  depends_on = [module.azurerm_nsg, module.azurerm_linux_virtual_machine]

}