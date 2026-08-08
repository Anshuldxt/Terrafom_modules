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

vm_dev = {

  Vm_1 = {

    name                 = "Vm_dev_1"
    resource_group_name  = "RG_dev_1"
    location             = "centralindia"
    size                 = "Standard_B1s"
    admin_username       = "adminuser"
    admin_password       = "Asusmbddr@2"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    nic_name             = "nic_dev_1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"


  }
}
