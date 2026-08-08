module "azurerm_resource_group" {
  source = "../../Modules/azurerm_resource_group"
  RG     = var.RG
}



module "azurerm_virtual_network" {
  source     = "../../Modules/azurerm_virtual_network"
  VNETs      = var.VNETs
  depends_on = [module.azurerm_resource_group]
}

module "azurerm_subnets" {
  source     = "../../Modules/azurerm_subnets"
  SNETs      = var.SNETs
  depends_on = [module.azurerm_virtual_network]
}

module "azurerm_public_ips" {
  source     = "../../Modules/azurerm_public_ips"
  PIPs       = var.PIPs
  depends_on = [module.azurerm_resource_group]

}


module "network_interface" {
  depends_on = [module.azurerm_resource_group, module.azurerm_subnets, module.azurerm_public_ips]
  source     = "../../Modules/azurerm_network_interface"
  var_nic    = var.module_nic
}

module "azurerm_virtual_machine" {
  source         = "../../Modules/azurerm_virtual_machine"
  depends_on     = [module.azurerm_resource_group, module.network_interface]
  var_vm         = var.PRODVMs
  key_vault_name = "mykey0021"
  key_vault_rg   = "rg-keyv"

}