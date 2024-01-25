variable "subscription_id" {}
variable "tenant_id" {}
variable "client_id" {}
variable "client_secret" {}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.88.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret

  features {}
}

resource "azurerm_container_group" "container_group" {
  name                = "container-group-nginx"
  location            = "eastus2"
  resource_group_name = "rg-container-nginx-iac"

  os_type = "Linux"

  container {
    name   = "nginx"
    image  = "nginx:latest"
    memory = 1
    cpu    = 1

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}
