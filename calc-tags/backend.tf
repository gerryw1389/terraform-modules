
terraform {
  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.20.0"
    }

    time = {
      source  = "hashicorp/time"
      version = ">= 0.9.1"
    }

    static = {
      source  = "tiwood/static"
      version = ">= 0.1.0"
    }
  }
}