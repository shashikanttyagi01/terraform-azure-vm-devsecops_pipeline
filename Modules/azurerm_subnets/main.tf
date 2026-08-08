resource "azurerm_subnet" "snet" {
  for_each = var.SNETs
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  #  resource_group_name = data.azurerm_resource_group.rg.name
  virtual_network_name = each.value.vnet_name
  address_prefixes = each.value.address_prefix
}