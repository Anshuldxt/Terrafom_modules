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