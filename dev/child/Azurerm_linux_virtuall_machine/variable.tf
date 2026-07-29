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
