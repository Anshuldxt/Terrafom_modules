variable "bastion_name" {
  description = "Azure Bastion host name"
  type        = string
}


variable "public_ip_name" {
  description = "Public IP name for Azure Bastion"
  type        = string
}


variable "location" {
  description = "Azure region"
  type        = string
}


variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}


variable "virtual_network_name" {
  description = "Virtual network containing AzureBastionSubnet"
  type        = string
}


variable "bastion_subnet_name" {
  description = "Bastion subnet name"
  type        = string

  default = "AzureBastionSubnet"
}


variable "sku" {
  description = "Azure Bastion SKU"
  type        = string

  default = "Basic"
}