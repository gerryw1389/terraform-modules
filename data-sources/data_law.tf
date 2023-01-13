
########################################################################
# Log Analytics - Data
########################################################################

data "azurerm_log_analytics_workspace" "aa_nonprod_southcentralus_hub_law" {
  name                = "aa-nonprod-southcentralus-hub-law"
  resource_group_name = "aa-nonprod-southcentralus-hub-law-rg"
  provider            = azurerm.nonprod-hub
}

data "azurerm_log_analytics_workspace" "aa_nonprod_eus_hub_law" {
  name                = "aa-nonprod-eus-hub-law"
  resource_group_name = "aa-nonprod-eus-hub-law-rg"
  provider            = azurerm.nonprod-hub
}

data "azurerm_log_analytics_workspace" "aa_prd_southcentralus_hub_law" {
  name                = "aa-prd-southcentralus-hub-law"
  resource_group_name = "aa-prd-southcentralus-hub-law-rg"
  provider            = azurerm.prod-hub
}

data "azurerm_log_analytics_workspace" "aa_prd_eus_hub_law" {
  name                = "aa-prd-eus-hub-law"
  resource_group_name = "aa-prd-eus-hub-law-rg"
  provider            = azurerm.prod-hub
}

########################################################################
# Log Analytics - Outputs
########################################################################

## Nonprod - South Central

output "law_nsc" {
  description = "The `id` property of the Log Analytics Workspace in the NonProd South Central environment."
  value       = data.azurerm_log_analytics_workspace.aa_nonprod_southcentralus_hub_law.id
}

output "law_nsc_name" {
  description = "The `name` property of the Log Analytics Workspace in the NonProd South Central environment."
  value       = split("/", data.azurerm_log_analytics_workspace.aa_nonprod_southcentralus_hub_law.id)[8]
}

output "law_nsc_rg" {
  description = "The Resource Group of the Log Analytics Workspace in the NonProd South Central environment."
  value       = split("/", data.azurerm_log_analytics_workspace.aa_nonprod_southcentralus_hub_law.id)[4]
}

output "law_nsc_location" {
  description = "The `location` property of the Log Analytics Workspace in the NonProd South Central environment."
  value       = data.azurerm_log_analytics_workspace.aa_nonprod_southcentralus_hub_law.location
}

output "law_nsc_workspace_id" {
  description = "The `workspace_id` property of the Log Analytics Workspace in the NonProd South Central environment."
  value       = data.azurerm_log_analytics_workspace.aa_nonprod_southcentralus_hub_law.workspace_id
}

### Nonprod - East

output "law_ne" {
  description = "The `id` property of the Log Analytics Workspace in the NonProd East environment."
  value       = data.azurerm_log_analytics_workspace.aa_nonprod_eus_hub_law.id
}

output "law_ne_name" {
  description = "The `name` property of the Log Analytics Workspace in the NonProd East environment."
  value       = split("/", data.azurerm_log_analytics_workspace.aa_nonprod_eus_hub_law.id)[8]
}

output "law_ne_rg" {
  description = "The Resource Group of the Log Analytics Workspace in the NonProd East environment."
  value       = split("/", data.azurerm_log_analytics_workspace.aa_nonprod_eus_hub_law.id)[4]
}

output "law_ne_location" {
  description = "The `location` property of the Log Analytics Workspace in the NonProd East environment."
  value       = data.azurerm_log_analytics_workspace.aa_nonprod_eus_hub_law.location
}

output "law_ne_workspace_id" {
  description = "The `workspace_id` property of the Log Analytics Workspace in the NonProd East environment."
  value       = data.azurerm_log_analytics_workspace.aa_nonprod_eus_hub_law.workspace_id
}

### Prod - South Central

output "law_psc" {
  description = "The `id` property of the Log Analytics Workspace in the Prod South Central environment."
  value       = data.azurerm_log_analytics_workspace.aa_prd_southcentralus_hub_law.id
}

output "law_psc_name" {
  description = "The `name` property of the Log Analytics Workspace in the Prod South Central environment."
  value       = split("/", data.azurerm_log_analytics_workspace.aa_prd_southcentralus_hub_law.id)[8]
}

output "law_psc_rg" {
  description = "The Resource Group of the Log Analytics Workspace in the Prod South Central environment."
  value       = split("/", data.azurerm_log_analytics_workspace.aa_prd_southcentralus_hub_law.id)[4]
}

output "law_psc_location" {
  description = "The `location` property of the Log Analytics Workspace in the Prod South Central environment."
  value       = data.azurerm_log_analytics_workspace.aa_prd_southcentralus_hub_law.location
}

output "law_psc_workspace_id" {
  description = "The `workspace_id` property of the Log Analytics Workspace in the Prod South Central environment."
  value       = data.azurerm_log_analytics_workspace.aa_prd_southcentralus_hub_law.workspace_id
}

### Prod - East

output "law_pe" {
  description = "The `id` property of the Log Analytics Workspace in the Prod East environment."
  value       = data.azurerm_log_analytics_workspace.aa_prd_eus_hub_law.id
}

output "law_pe_name" {
  description = "The `name` property of the Log Analytics Workspace in the Prod East environment."
  value       = split("/", data.azurerm_log_analytics_workspace.aa_prd_eus_hub_law.id)[8]
}

output "law_pe_rg" {
  description = "The Resource Group of the Log Analytics Workspace in the Prod East environment."
  value       = split("/", data.azurerm_log_analytics_workspace.aa_prd_eus_hub_law.id)[4]
}

output "law_pe_location" {
  description = "The `location` property of the Log Analytics Workspace in the Prod East environment."
  value       = data.azurerm_log_analytics_workspace.aa_prd_eus_hub_law.location
}

output "law_pe_workspace_id" {
  description = "The `workspace_id` property of the Log Analytics Workspace in the Prod East environment."
  value       = data.azurerm_log_analytics_workspace.aa_prd_eus_hub_law.workspace_id
}
