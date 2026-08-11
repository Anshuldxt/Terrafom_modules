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

  description = "SSH public key used for Linux VM authentication"

  type      = string
  sensitive = false
}