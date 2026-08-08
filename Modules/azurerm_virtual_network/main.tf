resource "azurerm_virtual_network" "vnet" {
  for_each = var.VNETs
  name = each.value.name
#   location = each.value.location
#   resource_group_name = each.value.resource_group_name
location = data.azurerm_resource_group.rg.location
resource_group_name = data.azurerm_resource_group.rg.name
  address_space = each.value.address_space
}