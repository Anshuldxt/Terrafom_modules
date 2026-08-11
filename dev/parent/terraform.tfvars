RG_Dev = {

  RG1 = {
    name       = "RG_dev_1"
    location   = "centralindia"
    managed_by = "anshul"
  }

  RG2 = {
    name       = "RG_dev_2"
    location   = "centralindia"
    managed_by = "anshul"
  }

}

Vnet_dev = {

  Vnet1 = {
    name                = "Vnet_dev_1"
    location            = "centralindia"
    resource_group_name = "RG_dev_1"
    address_space       = ["10.1.0.0/16"]

  }

  Vnet2 = {
    name                = "Vnet_dev_2"
    location            = "centralindia"
    resource_group_name = "RG_dev_2"
    address_space       = ["10.2.0.0/16"]


  }

}

subnet_dev = {

  subnet1 = {

    name                 = "subnet_dev_1"
    resource_group_name  = "RG_dev_1"
    virtual_network_name = "Vnet_dev_1"
    address_prefixes     = ["10.1.1.0/24"]
  }


  subnet2 = {

    name                 = "subnet_dev_2"
    resource_group_name  = "RG_dev_2"
    virtual_network_name = "Vnet_dev_2"
    address_prefixes     = ["10.2.1.0/24"]
  }

  # Bastion subnet
  bastion_subnet = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "RG_dev_1"
    virtual_network_name = "Vnet_dev_1"
    address_prefixes     = ["10.1.2.0/26"]
  }
}



nic_dev = {

  nic_1 = {

    name                          = "nic_dev_1"
    resource_group_name           = "RG_dev_1"
    location                      = "centralindia"
    ip_confi_name                 = "ipconfig1"
    private_ip_address            = "10.1.1.10"
    subnet_name                   = "subnet_dev_1"
    resource_group_name           = "RG_dev_1"
    virtual_network_name          = "Vnet_dev_1"
    private_ip_address_allocation = "Static"

  }

  nic_2 = {

    name                          = "nic_dev_2"
    resource_group_name           = "RG_dev_2"
    location                      = "centralindia"
    ip_confi_name                 = "ipconfig2"
    private_ip_address            = "10.2.1.10"
    subnet_name                   = "subnet_dev_2"
    resource_group_name           = "RG_dev_2"
    virtual_network_name          = "Vnet_dev_2"
    private_ip_address_allocation = "Static"


  }
}
ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFOTTLFFiuoNMtycYMzdwfUGQoEt6TTfz3Nf7thVjTwr azure-vm"
vm_dev = {

  vm_01 = {

    name                = "vm-dev-01"
    resource_group_name = "RG_dev_1"
    location            = "centralindia"
    size                = "Standard_B1s"

    admin_username = "azureadmin"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"

    nic_name = "nic_dev_1"

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

nsg_dev = {

  vm_nsg = {

    name                = "nsg-vm-dev"
    location            = "centralindia"
    resource_group_name = "RG_dev_1"

    security_rules = [

      {
        name      = "Allow-SSH-From-Bastion"
        priority  = 100
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"

        source_port_range      = "*"
        destination_port_range = "22"

        source_address_prefix      = "10.0.1.0/24"
        destination_address_prefix = "*"

        description = "Allow SSH from Bastion subnet"
      }
    ]
  }
}


nsg_subnet_association = {

  vm_subnet = {

    nsg_key              = "vm_nsg"
    subnet_name          = "snet-vm"
    virtual_network_name = "vnet-dev"
    resource_group_name  = "RG_dev_1"
  }
}

bastion_name = "bastion-dev-01"

public_ip_name = "pip-bastion-dev-01"

bastion_location = "centralindia"

bastion_resource_group_name = "RG_dev_1"

bastion_virtual_network_name = "Vnet_dev_1"

bastion_subnet_name = "AzureBastionSubnet"

bastion_sku = "Basic"