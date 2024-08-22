terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.78.0"
      #version = "~> 3.49.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  skip_provider_registration = true
}
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  alias                      = "mac-lab-sub-07-it"
  skip_provider_registration = true
  subscription_id            = var.subscription_id
}