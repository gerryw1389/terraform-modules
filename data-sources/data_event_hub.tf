
########################################################################
# Event Hubs - Data
########################################################################

data "azurerm_eventhub" "aa_nonprod_southcentralus_hub_eventhub" {
  name                = "aa-nonprod-southcentralus-hub-eventhub"
  resource_group_name = "aa-nonprod-southcentralus-hub-network-rg"
  namespace_name      = "aa-nonprod-southcentralus-hub-eventhubNamespace"
  provider            = azurerm.nonprod-hub
}

data "azurerm_eventhub" "aa_nonprod_eus_hub_eventhub" {
  name                = "aa-nonprod-eus-hub-eventhub"
  resource_group_name = "aa-nonprod-eus-hub-law-rg"
  namespace_name      = "aa-nonprod-eus-hub-eventhubNamespace"
  provider            = azurerm.nonprod-hub
}

data "azurerm_eventhub" "aa_prd_southcentralus_hub_eventhub" {
  name                = "aa-prd-southcentralus-hub-eventhub"
  resource_group_name = "aa-prd-southcentralus-hub-network-rg"
  namespace_name      = "aa-prd-southcentralus-hub-eventhubNamespace"
  provider            = azurerm.prod-hub
}

data "azurerm_eventhub" "aa_prd_eus_hub_eventhub" {
  name                = "aa-prd-eus-hub-eventhub"
  resource_group_name = "aa-prd-eus-hub-law-rg"
  namespace_name      = "aa-prd-eus-hub-eventhubNamespace"
  provider            = azurerm.prod-hub
}

########################################################################
# Event Hubs - Outputs
########################################################################

## Nonprod - South Central

output "eh_nsc" {
  description = "The `id` property of the Event Hub in the NonProd South Central environment."
  value       = data.azurerm_eventhub.aa_nonprod_southcentralus_hub_eventhub.id
}

output "eh_nsc_name" {
  description = "The `name` property of the Event Hub in the NonProd South Central environment."
  value       = data.azurerm_eventhub.aa_nonprod_southcentralus_hub_eventhub.name
}

output "eh_nsc_rg_name" {
  description = "The `resource_group_name` property of the Event Hub in the NonProd South Central environment."
  value       = data.azurerm_eventhub.aa_nonprod_southcentralus_hub_eventhub.resource_group_name
}

output "eh_nsc_ns_name" {
  description = "The `namespace_name` property of the Event Hub in the NonProd South Central environment."
  value       = data.azurerm_eventhub.aa_nonprod_southcentralus_hub_eventhub.namespace_name
}

### Nonprod - East
output "eh_ne" {
  description = "The `id` property of the Event Hub in the NonProd East environment."
  value       = data.azurerm_eventhub.aa_nonprod_eus_hub_eventhub.id
}

output "eh_ne_name" {
  description = "The `name` property of the Event Hub in the NonProd East environment."
  value       = data.azurerm_eventhub.aa_nonprod_eus_hub_eventhub.name
}

output "eh_ne_rg_name" {
  description = "The `resource_group_name` property of the Event Hub in the NonProd East environment."
  value       = data.azurerm_eventhub.aa_nonprod_eus_hub_eventhub.resource_group_name
}

output "eh_ne_ns_name" {
  description = "The `namespace_name` property of the Event Hub in the NonProd East environment."
  value       = data.azurerm_eventhub.aa_nonprod_eus_hub_eventhub.namespace_name
}

### Prod - South Central
output "eh_psc" {
  description = "The `id` property of the Event Hub in the Prod South Central environment."
  value       = data.azurerm_eventhub.aa_prd_southcentralus_hub_eventhub.id
}

output "eh_psc_name" {
  description = "The `name` property of the Event Hub in the Prod South Central environment."
  value       = data.azurerm_eventhub.aa_prd_southcentralus_hub_eventhub.name
}

output "eh_psc_rg_name" {
  description = "The `resource_group_name` property of the Event Hub in the Prod South Central environment."
  value       = data.azurerm_eventhub.aa_prd_southcentralus_hub_eventhub.resource_group_name
}

output "eh_psc_ns_name" {
  description = "The `namespace_name` property of the Event Hub in the Prod South Central environment."
  value       = data.azurerm_eventhub.aa_prd_southcentralus_hub_eventhub.namespace_name
}

### Prod - East
output "eh_pe" {
  description = "The `id` property of the Event Hub in the Prod East environment."
  value       = data.azurerm_eventhub.aa_prd_eus_hub_eventhub.id
}

output "eh_pe_name" {
  description = "The `name` property of the Event Hub in the Prod East environment."
  value       = data.azurerm_eventhub.aa_prd_eus_hub_eventhub.name
}

output "eh_pe_rg_name" {
  description = "The `resource_group_name` property of the Event Hub in the Prod East environment."
  value       = data.azurerm_eventhub.aa_prd_eus_hub_eventhub.resource_group_name
}

output "eh_pe_ns_name" {
  description = "The `namespace_name` property of the Event Hub in the Prod East environment."
  value       = data.azurerm_eventhub.aa_prd_eus_hub_eventhub.namespace_name
}

########################################################################
# Event Hubs Namespace Rules - Data
########################################################################

data "azurerm_eventhub_namespace_authorization_rule" "aa_nonprod_southcentralus_hub_eventhub" {
  name                = "aa-nonprod-southcentralus-hub-ehubns-rule"
  resource_group_name = data.azurerm_eventhub.aa_nonprod_southcentralus_hub_eventhub.resource_group_name
  namespace_name      = data.azurerm_eventhub.aa_nonprod_southcentralus_hub_eventhub.namespace_name
  provider            = azurerm.nonprod-hub
}

data "azurerm_eventhub_namespace_authorization_rule" "aa_nonprod_eus_hub_eventhub" {
  name                = "aa-nonprod-eus-hub-ehubns-rule"
  resource_group_name = data.azurerm_eventhub.aa_nonprod_eus_hub_eventhub.resource_group_name
  namespace_name      = data.azurerm_eventhub.aa_nonprod_eus_hub_eventhub.namespace_name
  provider            = azurerm.nonprod-hub
}

data "azurerm_eventhub_namespace_authorization_rule" "aa_prd_southcentralus_hub_eventhub" {
  name                = "aa-prd-southcentralus-hub-ehubns-rule"
  resource_group_name = data.azurerm_eventhub.aa_prd_southcentralus_hub_eventhub.resource_group_name
  namespace_name      = data.azurerm_eventhub.aa_prd_southcentralus_hub_eventhub.namespace_name
  provider            = azurerm.prod-hub
}

data "azurerm_eventhub_namespace_authorization_rule" "aa_prd_eus_hub_eventhub" {
  name                = "aa-prd-eus-hub-ehubns-rule"
  resource_group_name = data.azurerm_eventhub.aa_prd_eus_hub_eventhub.resource_group_name
  namespace_name      = data.azurerm_eventhub.aa_prd_eus_hub_eventhub.namespace_name
  provider            = azurerm.prod-hub
}


########################################################################
# Event Hubs Namespace Rules - Outputs
########################################################################

### Nonprod - South Central
output "ehnsr_nsc" {
  description = "The `id` property of the Event Hub Namespace Authorization Rule in the NonProd South Central environment."
  value       = data.azurerm_eventhub_namespace_authorization_rule.aa_nonprod_southcentralus_hub_eventhub.id
}

output "ehnsr_nsc_name" {
  description = "The `name` property of the Event Hub Namespace Authorization Rule in the NonProd South Central environment."
  value       = data.azurerm_eventhub_namespace_authorization_rule.aa_nonprod_southcentralus_hub_eventhub.name
}

### Nonprod - East
output "ehnsr_ne" {
  description = "The `id` property of the Event Hub Namespace Authorization Rule in the NonProd East environment."
  value       = data.azurerm_eventhub_namespace_authorization_rule.aa_nonprod_eus_hub_eventhub.id
}

output "ehnsr_ne_name" {
  description = "The `name` property of the Event Hub Namespace Authorization Rule in the NonProd East environment."
  value       = data.azurerm_eventhub_namespace_authorization_rule.aa_nonprod_eus_hub_eventhub.name
}

### Prod - South Central
output "ehnsr_psc" {
  description = "The `id` property of the Event Hub Namespace Authorization Rule in the Prod South Central environment."
  value       = data.azurerm_eventhub_namespace_authorization_rule.aa_prd_southcentralus_hub_eventhub.id
}

output "ehnsr_psc_name" {
  description = "The `name` property of the Event Hub Namespace Authorization Rule in the Prod South Central environment."
  value       = data.azurerm_eventhub_namespace_authorization_rule.aa_prd_southcentralus_hub_eventhub.name
}

### Prod - East
output "ehnsr_pe" {
  description = "The `id` property of the Event Hub Namespace Authorization Rule in the Prod East environment."
  value       = data.azurerm_eventhub_namespace_authorization_rule.aa_prd_eus_hub_eventhub.id
}

output "ehnsr_pe_name" {
  description = "The `name` property of the Event Hub Namespace Authorization Rule in the Prod East environment."
  value       = data.azurerm_eventhub_namespace_authorization_rule.aa_prd_eus_hub_eventhub.name
}