
########################################################################
# Step 1: Build providers to pass to Data Sources Module
########################################################################

data "azurerm_subscriptions" "available" {
  # Get all subscriptions
}

locals {

  available_subscriptions = data.azurerm_subscriptions.available.subscriptions

  hubnonprod_sub_id_object   = [for sub in local.available_subscriptions : sub if sub.display_name == "automationadmin-hub-nonprod"]
  data_sources_hubnonprod_id = length(local.hubnonprod_sub_id_object) == 1 ? local.hubnonprod_sub_id_object[0].subscription_id : "error_retrieving_hub-nonprod_id"

  hubprod_sub_id_object   = [for sub in local.available_subscriptions : sub if sub.display_name == "automationadmin-hub-prod"]
  data_sources_hubprod_id = length(local.hubprod_sub_id_object) == 1 ? local.hubprod_sub_id_object[0].subscription_id : "error_retrieving_hub-prod_id"

}

provider "azurerm" {
  client_id     = trimspace(var.client_id)
  client_secret = trimspace(var.client_secret)
  tenant_id     = trimspace(var.tenant_id)
  features {}
  alias                      = "data_sources_hub_nonprod"
  skip_provider_registration = true
  subscription_id            = local.data_sources_hubnonprod_id
}

provider "azurerm" {
  client_id     = trimspace(var.client_id)
  client_secret = trimspace(var.client_secret)
  tenant_id     = trimspace(var.tenant_id)
  features {}
  alias                      = "data_sources_hub_prod"
  skip_provider_registration = true
  subscription_id            = local.data_sources_hubprod_id
}

########################################################################
# Step 2: Call the Data Sources Module
########################################################################

module "dataLookup" {
  source          = "git::https://github.com/gerryw1389/terraform-modules.git//data-sources?ref=v1.0.0"
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  providers = {
    azurerm            = azurerm
    azurerm.nonprod-hub = azurerm.data_sources_hub_nonprod
    azurerm.prod-hub   = azurerm.data_sources_hub_prod
  }
}

########################################################################
# Step 3: Create lookups based on Module's Outputs and your local environment stage and region combination
########################################################################

locals {

  lookup = "${var.env_stage_abbr}_${var.region_abbr}"

  ## App Insights

  # id 
  ai_id_env_map = {
    "nonprod_scus" = module.dataLookup.aa_nonprod_scus_hub_ai_id,
    "prd_scus"    = module.dataLookup.aa_prd_scus_hub_ai_id,
  }
  ai_id = lookup(local.ai_id_env_map, local.lookup, "Error_Invalid_Lookup")

  # instrumentation_key
  ai_key_env_map = {
    "nonprod_scus" = module.dataLookup.aa_nonprod_scus_hub_ai_instrumentation_key,
    "prd_scus"    = module.dataLookup.aa_prd_scus_hub_ai_instrumentation_key,
  }
  ai_key = lookup(local.ai_key_env_map, local.lookup, "Error_Invalid_Lookup")

  ## Event Hub

  # id 
  eh_id_env_map = {
    "nonprod_scus" = module.dataLookup.eh_nsc,
    "nonprod_eus" = module.dataLookup.eh_ne,
    "prd_scus"    = module.dataLookup.eh_psc,
    "prd_eus"    = module.dataLookup.eh_pe,
  }
  eh_id = lookup(local.eh_id_env_map, local.lookup, "Error_Invalid_Lookup")

  # name 
  eh_name_env_map = {
    "nonprod_scus" = module.dataLookup.eh_nsc_name,
    "nonprod_eus" = module.dataLookup.eh_ne_name,
    "prd_scus"    = module.dataLookup.eh_psc_name,
    "prd_eus"    = module.dataLookup.eh_pe_name,
  }
  eh_name = lookup(local.eh_name_env_map, local.lookup, "Error_Invalid_Lookup")

  # resource_group
  eh_rg_env_map = {
    "nonprod_scus" = module.dataLookup.eh_nsc_rg_name,
    "nonprod_eus" = module.dataLookup.eh_ne_rg_name,
    "prd_scus"    = module.dataLookup.eh_psc_rg_name,
    "prd_eus"    = module.dataLookup.eh_pe_rg_name,
  }
  eh_rg = lookup(local.eh_rg_env_map, local.lookup, "Error_Invalid_Lookup")

  # namespace
  eh_ns_env_map = {
    "nonprod_scus" = module.dataLookup.eh_nsc_ns_name,
    "nonprod_eus" = module.dataLookup.eh_ne_ns_name,
    "prd_scus"    = module.dataLookup.eh_psc_ns_name,
    "prd_eus"    = module.dataLookup.eh_pe_ns_name,
  }
  eh_ns = lookup(local.eh_ns_env_map, local.lookup, "Error_Invalid_Lookup")

  # namespace_rule_id
  ehnsr_id_env_map = {
    "nonprod_scus" = module.dataLookup.ehnsr_nsc,
    "nonprod_eus" = module.dataLookup.ehnsr_ne,
    "prd_scus"    = module.dataLookup.ehnsr_psc,
    "prd_eus"    = module.dataLookup.ehnsr_pe,
  }
  ehnsr_id = lookup(local.ehnsr_id_env_map, local.lookup, "Error_Invalid_Lookup")

  # namespace_rule_name
  ehnsr_name_env_map = {
    "nonprod_scus" = module.dataLookup.ehnsr_nsc_name,
    "nonprod_eus" = module.dataLookup.ehnsr_ne_name,
    "prd_scus"    = module.dataLookup.ehnsr_psc_name,
    "prd_eus"    = module.dataLookup.ehnsr_pe_name,
  }
  ehnsr_name = lookup(local.ehnsr_name_env_map, local.lookup, "Error_Invalid_Lookup")

  ## Log Analytics

  # law_id
  law_id_env_map = {
    "nonprod_scus" = module.dataLookup.law_nsc,
    "nonprod_eus" = module.dataLookup.law_ne,
    "prd_scus"    = module.dataLookup.law_psc,
    "prd_eus"    = module.dataLookup.law_pe,
  }
  law_id = lookup(local.law_id_env_map, local.lookup, "Error_Invalid_Lookup")

  # law_name
  law_name_env_map = {
    "nonprod_scus" = module.dataLookup.law_nsc_name,
    "nonprod_eus" = module.dataLookup.law_ne_name,
    "prd_scus"    = module.dataLookup.law_psc_name,
    "prd_eus"    = module.dataLookup.law_pe_name,
  }

  law_name = lookup(local.law_name_env_map, local.lookup, "Error_Invalid_Lookup")

  # law_rg
  law_rg_env_map = {
    "nonprod_scus" = module.dataLookup.law_nsc_rg,
    "nonprod_eus" = module.dataLookup.law_ne_rg,
    "prd_scus"    = module.dataLookup.law_psc_rg,
    "prd_eus"    = module.dataLookup.law_pe_rg,
  }

  law_rg = lookup(local.law_rg_env_map, local.lookup, "Error_Invalid_Lookup")

  ## Network Watcher

  # name
  nw_name_env_map = {
    "nonprod_scus" = module.dataLookup.nw_west_name,
    "nonprod_eus" = module.dataLookup.nw_east_name,
    "prd_scus"    = module.dataLookup.nw_west_name,
    "prd_eus"    = module.dataLookup.nw_east_name,
  }

  nw_name = lookup(local.nw_name_env_map, local.lookup, "Error_Invalid_Lookup")

  # resource_group
  nw_rg_env_map = {
    "nonprod_scus" = module.dataLookup.nw_west_rg,
    "nonprod_eus" = module.dataLookup.nw_east_rg,
    "prd_scus"    = module.dataLookup.nw_west_rg,
    "prd_eus"    = module.dataLookup.nw_east_rg,
  }

  nw_rg = lookup(local.nw_rg_env_map, local.lookup, "Error_Invalid_Lookup")

  # law_location
  law_location_env_map = {
    "nonprod_scus" = module.dataLookup.law_nsc_location,
    "nonprod_eus" = module.dataLookup.law_ne_location,
    "prd_scus"    = module.dataLookup.law_psc_location,
    "prd_eus"    = module.dataLookup.law_pe_location,
  }

  law_location = lookup(local.law_location_env_map, local.lookup, "Error_Invalid_Lookup")

  # law_workspace_id
  law_workspace_id_env_map = {
    "nonprod_scus" = module.dataLookup.law_nsc_workspace_id,
    "nonprod_eus" = module.dataLookup.law_ne_workspace_id,
    "prd_scus"    = module.dataLookup.law_psc_workspace_id,
    "prd_eus"    = module.dataLookup.law_pe_workspace_id,
  }

  law_workspace_id = lookup(local.law_workspace_id_env_map, local.lookup, "Error_Invalid_Lookup")

  ### Private DNS Zones

  priv_dns_zone_rg = module.dataLookup.priv_dns_zone_rg

  priv_dns_zone_lookup = "privatelink.vaultcore.azure.net"

  zone_name_lookup_map = {
    "privatelink.azconfig.io"                 = module.dataLookup.azconfig_io_name,
    "privatelink.azure-automation.net"        = module.dataLookup.azure-automation_net_name,
    "privatelink.azureacr.io"                 = module.dataLookup.azureacr_io_name,
    "privatelink.azurecr.io"                  = module.dataLookup.azurecr_io_name,
    "privatelink.azurewebsites.net"           = module.dataLookup.azurewebsites_net_name,
    "privatelink.blob.core.windows.net"       = module.dataLookup.blob_core_windows_net_name,
    "privatelink.database.windows.net"        = module.dataLookup.database_windows_net_name,
    "privatelink.east.azmk8s.io"              = module.dataLookup.east_azmk8s_io_name,
    "privatelink.file.core.windows.net"       = module.dataLookup.file_core_windows_net_name,
    "privatelink.postgres.database.azure.com" = module.dataLookup.postgres_database_azure_com_name,
    "privatelink.queue.core.windows.net"      = module.dataLookup.queue_core_windows_net_name,
    "privatelink.servicebus.windows.net"      = module.dataLookup.servicebus_windows_net_name,
    "privatelink.table.core.windows.net"      = module.dataLookup.table_core_windows_net_name,
    "privatelink.vaultcore.azure.net"         = module.dataLookup.vaultcore_azure_net_name,
    "privatelink.web.core.windows.net"        = module.dataLookup.web_core_windows_net_name,
    "privatelink.west.azmk8s.io"              = module.dataLookup.west_azmk8s_io_name
  }

  priv_dns_zone_name = lookup(local.zone_name_lookup_map, local.priv_dns_zone_lookup, "Error_Invalid_Lookup")

  zone_id_lookup_map = {
    "privatelink.azconfig.io"                 = module.dataLookup.azconfig_io_id,
    "privatelink.azure-automation.net"        = module.dataLookup.azure-automation_net_id,
    "privatelink.azureacr.io"                 = module.dataLookup.azureacr_io_id,
    "privatelink.azurecr.io"                  = module.dataLookup.azurecr_io_id,
    "privatelink.azurewebsites.net"           = module.dataLookup.azurewebsites_net_id,
    "privatelink.blob.core.windows.net"       = module.dataLookup.blob_core_windows_net_id,
    "privatelink.database.windows.net"        = module.dataLookup.database_windows_net_id,
    "privatelink.east.azmk8s.io"              = module.dataLookup.east_azmk8s_io_id,
    "privatelink.file.core.windows.net"       = module.dataLookup.file_core_windows_net_id,
    "privatelink.postgres.database.azure.com" = module.dataLookup.postgres_database_azure_com_id,
    "privatelink.queue.core.windows.net"      = module.dataLookup.queue_core_windows_net_id,
    "privatelink.servicebus.windows.net"      = module.dataLookup.servicebus_windows_net_id,
    "privatelink.table.core.windows.net"      = module.dataLookup.table_core_windows_net_id,
    "privatelink.vaultcore.azure.net"         = module.dataLookup.vaultcore_azure_net_id,
    "privatelink.web.core.windows.net"        = module.dataLookup.web_core_windows_net_id,
    "privatelink.west.azmk8s.io"              = module.dataLookup.west_azmk8s_io_id
  }

  priv_dns_zone_id = lookup(local.zone_id_lookup_map, local.priv_dns_zone_lookup, "Error_Invalid_Lookup")
}
