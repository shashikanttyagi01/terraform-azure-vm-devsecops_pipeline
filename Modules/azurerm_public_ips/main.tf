resource "azurerm_public_ip" "publicip" {
    for_each = var.PIPs
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
#   location = data.azurerm_resource_group.rg.location
#   resource_group_name = data.azurerm_resource_group.rg.name
    allocation_method = "Static"
}