variable "RG_Dev" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
  }))
}

variable "Vnet_dev" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}

variable "subnet_dev" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "nic_dev" {
  type = map(object({
    name                          = string
    resource_group_name           = string
    location                      = string
    ip_confi_name                 = string
    private_ip_address            = string
    subnet_name                   = string
    virtual_network_name          = string
    private_ip_address_allocation = string
  }))
}

variable "vm_dev" {

  description = "Linux VM configuration"

  type = map(object({

    name                = string
    resource_group_name = string
    location            = string
    size                = string

    admin_username = string

    publisher = string
    offer     = string
    sku       = string
    version   = string

    nic_name = string

    caching              = string
    storage_account_type = string
  }))
}


variable "ssh_public_key" {

  description = "SSH public key for VM authentication"

  type = string
}

variable "nsg_dev" {

  description = "Network Security Groups"

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string

    security_rules = list(object({

      name      = string
      priority  = number
      direction = string
      access    = string
      protocol  = string

      source_port_range      = string
      destination_port_range = string

      source_address_prefix      = string
      destination_address_prefix = string

      description = optional(string)
    }))
  }))
}


variable "nsg_subnet_association" {

  description = "NSG to existing subnet association"

  type = map(object({

    nsg_key              = string
    subnet_name          = string
    virtual_network_name = string
    resource_group_name  = string
  }))
}




variable "bastion_name" {
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "bastion_location" {
  type = string
}

variable "bastion_resource_group_name" {
  type = string
}

variable "bastion_virtual_network_name" {
  type = string
}

variable "bastion_subnet_name" {
  type    = string
  default = "AzureBastionSubnet"
}

variable "bastion_sku" {
  type    = string
  default = "Basic"
}