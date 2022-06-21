resource "azurerm_app_service" "test-az-1" {
  app_service_plan_id = ""
  location            = ""
  name                = ""
  resource_group_name = ""
  tags                = {
    Environment = "environment",
    CreatedBy   = "terraform",
    Project     = "tfsec-custom-tests"
  }

  site_config {
    java_version = "17"
  }
}

resource "azurerm_virtual_machine" "test-az-2" {
  location              = ""
  name                  = ""
  network_interface_ids = []
  resource_group_name   = ""
  vm_size               = ""
  tags                = var.tags
  storage_os_disk {
    create_option = ""
    name          = ""
    managed_disk_type = ""
  }
}

variable "tags" {
  default = {
    Environment = "environment",
    CreatedBy   = "terraform",
    Project     = "tfsec-custom-tests"
  }
}
