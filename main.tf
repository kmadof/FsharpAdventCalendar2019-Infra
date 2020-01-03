resource "azurerm_resource_group" "default" { 
  name     = var.namespace
  location = var.region 
}

resource "random_string" "rand" {
  length  = 24
  special = false
  upper   = false
}

locals {
  namespace = substr(join("-", [var.namespace, random_string.rand.result]), 0, 24)
}

resource "azurerm_sql_server" "database_server" {
  name                         = local.namespace
  resource_group_name          = "${azurerm_resource_group.default.name}"
  location                     = var.region
  version                      = "12.0"
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_pass
}

resource "azurerm_sql_database" "fs_advent_db" {
  name                = "FsharpAdventureWorks"
  resource_group_name = "${azurerm_resource_group.default.name}"
  location            = var.region
  server_name         = "${azurerm_sql_server.database_server.name}"

  tags = {
    environment = "production"
  }
}

resource "azurerm_sql_database" "fs_advent_dw_db" {
  name                = "FsharpAdventureWorksDW"
  resource_group_name = "${azurerm_resource_group.default.name}"
  location            = var.region
  server_name         = "${azurerm_sql_server.database_server.name}"

  tags = {
    environment = "production"
  }
}