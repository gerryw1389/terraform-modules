
data "external" "json" {
program = ["sh", "-c", "curl -X GET -v -L -H 'Connection: close' 'https://${var.pathToFunctionApp}}?subscriptionId=${var.source_subscriptionId}}&resourceGroupName=${var.source_resourceGroupName}}&virtualNetworkName=${var.source_virtualNetworkName}}&cidr=${var.cidr}&previousblock=${var.previous_block}' "]
}

resource "random_string" "random_suffix" {
  keepers = {
    resource_group = var.source_resourceGroupName
  }
  length  = 5
  upper   = false
  lower   = true
  numeric = true
  special = false
}

resource "azurerm_subnet" "subnet" {
  name = "aa-${var.env_stage_abbr}-${var.region_abbr}-sn-${random_string.random_suffix.result}"
  address_prefixes     = [data.external.json.result["proposedCIDR"]]
  resource_group_name  = var.source_resourceGroupName
  virtual_network_name = var.source_virtualNetworkName
  service_endpoints    = var.service_endpoints
  
  dynamic "delegation" {
    for_each = var.server_farm_delegation == true ? [1] : []
    content {
      name = "ServerFarmsDelegation"
      service_delegation {
        name    = "Microsoft.Web/serverFarms"
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    }
  }
}
