
########################################################################
# Private DNS Zones - Data
########################################################################

locals {
  hub_prod_primary_priv_dns_zone_rg_name = "aa-prod-hub-dns-rg"
}

data "azurerm_private_dns_zone" "privatelink_azconfig_io" {
  name                = "privatelink.azconfig.io"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

data "azurerm_private_dns_zone" "privatelink_azure-automation_net" {
  name                = "privatelink.azure-automation.net"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

data "azurerm_private_dns_zone" "privatelink_azureacr_io" {
  name                = "privatelink.azureacr.io"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

data "azurerm_private_dns_zone" "privatelink_azurecr_io" {
  name                = "privatelink.azurecr.io"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

data "azurerm_private_dns_zone" "privatelink_azurewebsites_net" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

data "azurerm_private_dns_zone" "privatelink_blob_core_windows_net" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

data "azurerm_private_dns_zone" "privatelink_database_windows_net" {
  name                = "privatelink.database.windows.net"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

data "azurerm_private_dns_zone" "privatelink_east_azmk8s_io" {
  name                = "privatelink.east.azmk8s.io"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

data "azurerm_private_dns_zone" "privatelink_file_core_windows_net" {
  name                = "privatelink.file.core.windows.net"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

data "azurerm_private_dns_zone" "privatelink_postgres_database_azure_com" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

data "azurerm_private_dns_zone" "privatelink_queue_core_windows_net" {
  name                = "privatelink.queue.core.windows.net"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

data "azurerm_private_dns_zone" "privatelink_servicebus_windows_net" {
  name                = "privatelink.servicebus.windows.net"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

data "azurerm_private_dns_zone" "privatelink_table_core_windows_net" {
  name                = "privatelink.table.core.windows.net"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

data "azurerm_private_dns_zone" "privatelink_vaultcore_azure_net" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

data "azurerm_private_dns_zone" "privatelink_web_core_windows_net" {
  name                = "privatelink.web.core.windows.net"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

data "azurerm_private_dns_zone" "privatelink_South Central_azmk8s_io" {
  name                = "privatelink.South Central.azmk8s.io"
  resource_group_name = local.hub_prod_primary_priv_dns_zone_rg_name
  provider            = azurerm.prod-hub
}

########################################################################
# Private DNS Zones - Outputs
########################################################################

# privatelink.azconfig.io
output "priv_dns_zone_rg" {
  description = "The `name` property of the Resource Group of the Private DNS Zone."
  value       = local.hub_prod_primary_priv_dns_zone_rg_name
}

# privatelink.azconfig.io
output "azconfig_io_name" {
  description = "The `name` property of the DNS Zone `privatelink.azconfig.io`."
  value       = data.azurerm_private_dns_zone.privatelink_azconfig_io.name
}

output "azconfig_io_id" {
  description = "The `id` property of the DNS Zone `privatelink.azconfig.io`."
  value       = data.azurerm_private_dns_zone.privatelink_azconfig_io.id
}

# privatelink.azure-automation.net
output "azure-automation_net_name" {
  description = "The `name` property of the DNS Zone `privatelink.azure-automation.net`."
  value       = data.azurerm_private_dns_zone.privatelink_azure-automation_net.name
}

output "azure-automation_net_id" {
  description = "The `id` property of the DNS Zone `privatelink.azure-automation.net`."
  value       = data.azurerm_private_dns_zone.privatelink_azure-automation_net.id
}

# privatelink.azureacr.io
output "azureacr_io_name" {
  description = "The `name` property of the DNS Zone `privatelink.azureacr.io`."
  value       = data.azurerm_private_dns_zone.privatelink_azureacr_io.name
}

output "azureacr_io_id" {
  description = "The `id` property of the DNS Zone `privatelink.azureacr.io`."
  value       = data.azurerm_private_dns_zone.privatelink_azureacr_io.id
}

# privatelink.azurecr.io
output "azurecr_io_name" {
  description = "The `name` property of the DNS Zone `privatelink.azurecr.io`."
  value       = data.azurerm_private_dns_zone.privatelink_azurecr_io.name
}

output "azurecr_io_id" {
  description = "The `id` property of the DNS Zone `privatelink.azurecr.io`."
  value       = data.azurerm_private_dns_zone.privatelink_azurecr_io.id
}

# privatelink.azurewebsites.net
output "azurewebsites_net_name" {
  description = "The `name` property of the DNS Zone `privatelink.azurewebsites.net`."
  value       = data.azurerm_private_dns_zone.privatelink_azurewebsites_net.name
}

output "azurewebsites_net_id" {
  description = "The `id` property of the DNS Zone `privatelink.azurewebsites.net`."
  value       = data.azurerm_private_dns_zone.privatelink_azurewebsites_net.id
}

# privatelink.blob.core.windows.net
output "blob_core_windows_net_name" {
  description = "The `name` property of the DNS Zone `privatelink.blob.core.windows.net`."
  value       = data.azurerm_private_dns_zone.privatelink_blob_core_windows_net.name
}

output "blob_core_windows_net_id" {
  description = "The `id` property of the DNS Zone `privatelink.blob.core.windows.net`."
  value       = data.azurerm_private_dns_zone.privatelink_blob_core_windows_net.id
}

# privatelink.database.windows.net
output "database_windows_net_name" {
  description = "The `name` property of the DNS Zone `privatelink.database.windows.net`."
  value       = data.azurerm_private_dns_zone.privatelink_database_windows_net.name
}

output "database_windows_net_id" {
  description = "The `id` property of the DNS Zone `privatelink.database.windows.net`."
  value       = data.azurerm_private_dns_zone.privatelink_database_windows_net.id
}

# privatelink.east.azmk8s.io
output "east_azmk8s_io_name" {
  description = "The `name` property of the DNS Zone `privatelink.east.azmk8s.io`."
  value       = data.azurerm_private_dns_zone.privatelink_east_azmk8s_io.name
}

output "east_azmk8s_io_id" {
  description = "The `id` property of the DNS Zone `privatelink.east.azmk8s.io`."
  value       = data.azurerm_private_dns_zone.privatelink_east_azmk8s_io.id
}

# privatelink.file.core.windows.net
output "file_core_windows_net_name" {
  description = "The `name` property of the DNS Zone `privatelink.file.core.windows.net`."
  value       = data.azurerm_private_dns_zone.privatelink_file_core_windows_net.name
}

output "file_core_windows_net_id" {
  description = "The `id` property of the DNS Zone `privatelink.file.core.windows.net`."
  value       = data.azurerm_private_dns_zone.privatelink_file_core_windows_net.id
}

# privatelink.postgres.database.azure.com
output "postgres_database_azure_com_name" {
  description = "The `name` property of the DNS Zone `privatelink.postgres.database.azure.com`."
  value       = data.azurerm_private_dns_zone.privatelink_postgres_database_azure_com.name
}

output "postgres_database_azure_com_id" {
  description = "The `id` property of the DNS Zone `privatelink.postgres.database.azure.com`."
  value       = data.azurerm_private_dns_zone.privatelink_postgres_database_azure_com.id
}

# privatelink.queue.core.windows.net
output "queue_core_windows_net_name" {
  description = "The `name` property of the DNS Zone `privatelink.queue.core.windows.net`."
  value       = data.azurerm_private_dns_zone.privatelink_queue_core_windows_net.name
}

output "queue_core_windows_net_id" {
  description = "The `id` property of the DNS Zone `privatelink.queue.core.windows.net`."
  value       = data.azurerm_private_dns_zone.privatelink_queue_core_windows_net.id
}

# privatelink.servicebus.windows.net
output "servicebus_windows_net_name" {
  description = "The `name` property of the DNS Zone `privatelink.servicebus.windows.net`."
  value       = data.azurerm_private_dns_zone.privatelink_servicebus_windows_net.name
}

output "servicebus_windows_net_id" {
  description = "The `id` property of the DNS Zone `privatelink.servicebus.windows.net`."
  value       = data.azurerm_private_dns_zone.privatelink_servicebus_windows_net.id
}

# privatelink.table.core.windows.net
output "table_core_windows_net_name" {
  description = "The `name` property of the DNS Zone `privatelink.table.core.windows.net`."
  value       = data.azurerm_private_dns_zone.privatelink_table_core_windows_net.name
}

output "table_core_windows_net_id" {
  description = "The `id` property of the DNS Zone `privatelink.table.core.windows.net`."
  value       = data.azurerm_private_dns_zone.privatelink_table_core_windows_net.id
}

# privatelink.vaultcore.azure.net
output "vaultcore_azure_net_name" {
  description = "The `name` property of the DNS Zone `privatelink.vaultcore.azure.net`."
  value       = data.azurerm_private_dns_zone.privatelink_vaultcore_azure_net.name
}

output "vaultcore_azure_net_id" {
  description = "The `id` property of the DNS Zone `privatelink.vaultcore.azure.net`."
  value       = data.azurerm_private_dns_zone.privatelink_vaultcore_azure_net.id
}

# privatelink.web.core.windows.net
output "web_core_windows_net_name" {
  description = "The `name` property of the DNS Zone `privatelink.web.core.windows.net`."
  value       = data.azurerm_private_dns_zone.privatelink_web_core_windows_net.name
}

output "web_core_windows_net_id" {
  description = "The `id` property of the DNS Zone `privatelink.web.core.windows.net`."
  value       = data.azurerm_private_dns_zone.privatelink_web_core_windows_net.id
}
