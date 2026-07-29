resource "azurerm_resource_group" "RG_Dev" {
  
for_each = var.RG_Dev

name = each.value.name
location = each.value.location 
managed_by = each.value.managed_by


}