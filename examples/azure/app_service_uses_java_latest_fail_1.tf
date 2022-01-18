resource "azurerm_app_service" "test1" {
  app_service_plan_id = ""
  location            = ""
  name                = ""
  resource_group_name = ""
  site_config {
    java_version = "11"
  }
}

resource "azurerm_app_service" "test2" {
  app_service_plan_id = ""
  location            = ""
  name                = ""
  resource_group_name = ""
  site_config {}
}

resource "azurerm_app_service" "test3" {
  app_service_plan_id = ""
  location            = ""
  name                = ""
  resource_group_name = ""
}