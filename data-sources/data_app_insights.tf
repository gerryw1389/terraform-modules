
########################################################################
# Application Insights - Data
########################################################################

data "azurerm_application_insights" "aa_nonprod_southcentralus_hub_ai" {
  name                = "aa-nonprod-southcentralus-hub-ai"
  resource_group_name = "aa-nonprod-southcentralus-hub-ai-rg"
  provider            = azurerm.nonprod-hub
}

data "azurerm_application_insights" "aa_prd_southcentralus_hub_ai" {
  name                = "aa-prd-southcentralus-hub-ai"
  resource_group_name = "aa-prd-southcentralus-hub-ai-rg"
  provider            = azurerm.prod-hub
}

########################################################################
# Application Insights - Outputs
########################################################################

### Nonprod - South Central

output "aa_nonprod_southcentralus_hub_ai_id" {
  description = "The `id` property of the App Insights resource in the NonProd South Central environment."
  value       = data.azurerm_application_insights.aa_nonprod_southcentralus_hub_ai.id
}

output "aa_nonprod_southcentralus_hub_ai_instrumentation_key" {
  description = "The `instrumentation_key` property of the App Insights resource in the NonProd South Central environment."
  value       = data.azurerm_application_insights.aa_nonprod_southcentralus_hub_ai.instrumentation_key
}

### Prod - South Central

output "aa_prd_southcentralus_hub_ai_id" {
  description = "The `id` property of the App Insights resource in the Prod South Central environment."
  value       = data.azurerm_application_insights.aa_prd_southcentralus_hub_ai.id
}

output "aa_prd_southcentralus_hub_ai_instrumentation_key" {
  description = "The `instrumentation_key` property of the App Insights resource in the Prod South Central environment."
  value       = data.azurerm_application_insights.aa_prd_southcentralus_hub_ai.instrumentation_key
}
