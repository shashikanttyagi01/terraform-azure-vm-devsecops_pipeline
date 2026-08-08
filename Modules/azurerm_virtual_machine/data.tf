data "azurerm_network_interface" "vm_id" {
    for_each = var.var_vm
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}

data "azurerm_resource_group" "rg" {
  name = "prodrg1"
}

data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg
}

data "azurerm_key_vault_secret" "vm_password" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.kv.id
}