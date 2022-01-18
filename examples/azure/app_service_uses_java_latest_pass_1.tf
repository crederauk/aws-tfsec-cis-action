resource "azurerm_app_service" "test" {
  app_service_plan_id = ""
  location            = ""
  name                = ""
  resource_group_name = ""
  site_config {
    java_version = "17"
  }
}