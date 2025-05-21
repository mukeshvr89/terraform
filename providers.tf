terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.29.0"
    }
  }
}

variable "subscription_id" {
  type = string
  description = "The Azure subscription ID to use for the provider."
}
provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = var.subscription_id
}