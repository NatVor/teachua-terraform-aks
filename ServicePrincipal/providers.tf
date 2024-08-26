provider "azurerm" {
  features {}

  subscription_id = var.AZURE_SUBSCRIPTION_ID
  client_id       = var.CLIENT_ID
  client_secret   = var.CLIENT_SECRET
  tenant_id       = var.SERVICE_PRINCIPAL_TENANT_ID
}

provider "azuread" {
  tenant_id     = var.SERVICE_PRINCIPAL_TENANT_ID
  client_id     = var.CLIENT_ID
  client_secret = var.CLIENT_SECRET
}
