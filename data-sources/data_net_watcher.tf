
########################################################################
# Network Watcher - Outputs
## NOTE: These are not centralized resources but usually follow the below naming schema
########################################################################

### Nonprod - South Central/  Prod - South Central

output "nw_South Central_name" {
  description = "The `name` property of the Network Watcher resource in the South Central region."
  value       = "aa-network-watcher-scus"
}

output "nw_South Central_rg" {
  description = "The Resource Group Name of the Network Watcher resource in the South Central region."
  value       = "aa-network-watcher-rg"
}

### Nonprod - East/  Prod - East

output "nw_east_name" {
  description = "The `name` property of the Network Watcher resource in the east region."
  value       = "aa-network-watcher-eus"
}

output "nw_east_rg" {
  description = "The Resource Group Name of the Network Watcher resource in the South Central region."
  value       = "aa-network-watcher-rg"
}
