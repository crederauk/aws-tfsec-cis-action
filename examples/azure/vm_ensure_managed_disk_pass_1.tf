resource "azurerm_virtual_machine" "test1" {
  location              = ""
  name                  = ""
  network_interface_ids = []
  resource_group_name   = ""
  vm_size               = ""
  storage_os_disk {
    create_option = ""
    name          = ""
    managed_disk_id = ""
  }
}

resource "azurerm_virtual_machine" "test2" {
  location              = ""
  name                  = ""
  network_interface_ids = []
  resource_group_name   = ""
  vm_size               = ""
  storage_os_disk {
    create_option = ""
    name          = ""
    managed_disk_type = ""
  }
}