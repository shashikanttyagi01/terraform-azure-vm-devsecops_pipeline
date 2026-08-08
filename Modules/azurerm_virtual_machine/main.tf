resource "azurerm_virtual_machine" "vms" {
  for_each              = var.var_vm
  name                  = each.value.name
  # location              = each.value.location
  # resource_group_name   = each.value.resource_group_name
  location = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  network_interface_ids = [data.azurerm_network_interface.vm_id[each.key].id]
  vm_size               = each.value.vm_size
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }

  storage_os_disk {
    name              = each.value.osdiskname
    caching           = each.value.caching
    create_option     = each.value.create_option
    managed_disk_type = each.value.managed_disk_type
  }

  os_profile {
    computer_name  = each.value.computer_name
    admin_username = each.value.admin_username
    # admin_password = each.value.admin_password

  admin_password = data.azurerm_key_vault_secret.vm_password.value

  }
  
  os_profile_linux_config {
    disable_password_authentication = each.value.disable_password_authentication
  }
}

