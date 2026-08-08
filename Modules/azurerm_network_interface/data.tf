data "azurerm_subnet" "subnet_id" {
  for_each             = var.var_nic
  name                 = each.value.subname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "public_ip" {
  for_each            = var.var_nic
  name                = each.value.pipname
  resource_group_name = each.value.resource_group_name
}

