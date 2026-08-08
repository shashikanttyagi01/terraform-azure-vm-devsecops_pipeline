resource "azurerm_network_interface" "nics" {
  for_each            = var.var_nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  #   location = data.azurerm_resource_group.rg.location
  # resource_group_name = data.azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_id[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.public_ip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}