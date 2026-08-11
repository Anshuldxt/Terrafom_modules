variable "nsg_dev" {

  description = "Network Security Group configuration"

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

  description = "Existing subnet information for NSG association"

  type = map(object({

    nsg_key              = string
    subnet_name          = string
    virtual_network_name = string
    resource_group_name  = string
  }))
}