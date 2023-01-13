
# 2022-12-16 => Move logic to calling module per https://developer.hashicorp.com/terraform/language/modules/develop/providers#legacy-shared-modules-with-provider-configurations
# Instead of building providers within module, pass them in
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      configuration_aliases = [azurerm.nonprod-hub, azurerm.prod-hub, ]
      version = ">= 3.20.0"
    }
  }
}