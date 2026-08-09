RG = {

  rg1 = {

    name     = "prodrg1"
    location = "central india"
    # prevent_deletion_if_contains_resources = false
  }

  rg2 = {

    name     = "prodrg2"
    location = "central india"
  }
}

VNETs = {

  vnet1 = {
    name = "prodvnet1"
    # location            = "central india"
    # resource_group_name = "prodrg1"
    address_space = ["10.0.0.0/24"]
  }
  vnet2 = {
    name = "prodvnet2"
    # location            = "central india"
    # resource_group_name = "prodrg1"
    address_space = ["10.0.1.0/24"]
  }
}

SNETs = {
  snet1 = {
    name                = "prodsnet1"
    vnet_name           = "prodvnet1"
    address_prefix      = ["10.0.0.0/26"]
    resource_group_name = "prodrg1"
  }

  snet2 = {
    name                = "prodsnet2"
    vnet_name           = "prodvnet1"
    address_prefix      = ["10.0.0.64/26"]
    resource_group_name = "prodrg1"
  }
}

PIPs = {
  pip1 = {
    name                = "prodpip1"
    resource_group_name = "prodrg1"
    location            = "central india"
    allocation_method   = "static"
  }

  pip2 = {
    name                = "prodpip2"
    resource_group_name = "prodrg1"
    location            = "central india"
    allocation_method   = "static"
  }
}

module_nic = {
  nic1 = {
    name                 = "prodnic1"
    location             = "central india"
    resource_group_name  = "prodrg1"
    subname              = "prodsnet1"
    pipname              = "prodpip1"
    virtual_network_name = "prodvnet1"
  }
  nic2 = {
    name                 = "prodnic2"
    location             = "central india"
    resource_group_name  = "prodrg1"
    subname              = "prodsnet1"
    pipname              = "prodpip2"
    virtual_network_name = "prodvnet1"
  }
}

PRODVMs = {
  vm1 = {
    name = "linux_vm1"
    # location                        = "central india"
    nicname             = "prodnic1"
    resource_group_name = "prodrg1"
    vm_size             = "Standard_D2s_v3"
    publisher           = "Canonical"
    offer               = "0001-com-ubuntu-server-jammy"
    sku                 = "22_04-lts-gen2"
    version             = "latest"
    osdiskname          = "myosdisk222"
    caching             = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Standard_LRS"
    computer_name       = "vm2"
    admin_username      = "testadmin"
    admin_password      = "Adminpassword@9984"

    disable_password_authentication = "false"
  }
  vm2 = {
    name = "linux_vm2"
    # location                        = "central india"
    nicname             = "prodnic2"
    resource_group_name = "prodrg1"
    vm_size             = "Standard_D2s_v3"
    publisher           = "Canonical"
    offer               = "0001-com-ubuntu-server-jammy"
    sku                 = "22_04-lts-gen2"
    version             = "latest"
    osdiskname          = "myosdisk223"
    caching             = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Standard_LRS"
    computer_name       = "vm2"
    admin_username      = "testadmin"
    admin_password      = "Adminpassword@9984"

    disable_password_authentication = "false"
  }
}
