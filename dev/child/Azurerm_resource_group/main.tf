terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
}


resource "azurerm_resource_group" "RG_Dev" {

  for_each = var.RG_Dev

  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.managed_by


}