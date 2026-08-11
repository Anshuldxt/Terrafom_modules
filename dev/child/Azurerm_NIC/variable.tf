
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