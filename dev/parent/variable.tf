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
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    size                 = string
    admin_username       = string
    admin_password       = string
    publisher            = string
    offer                = string
    sku                  = string
    version              = string
    nic_name             = string
    caching              = string
    storage_account_type = string
  }))
}