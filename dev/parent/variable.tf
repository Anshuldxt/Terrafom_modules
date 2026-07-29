variable "RG_Dev" {
    type = object({
    name     = string
    location = string
  })

}
variable "Vnet_dev" {
    type = object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  })
}

variable "subnet_dev" {
    type = object({
    name                 = string
    resource_group_name = string
    virtual_network_name = string
    address_prefixes     = list(string)
  })
}

variable "nic_dev" {
    type = object({
    name                 = string
    resource_group_name = string
    subnet_id            = string
  })
}

variable "vm_dev" {
    type = object({
    name                 = string
    location             = string
    size                 = string
    admin_username       = string
    admin_password       = string
    publisher            = string
    offer                = string
    sku                  = string
  })
}

