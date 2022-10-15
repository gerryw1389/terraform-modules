

variable "pathToFunctionApp" {
  description = "(Required) The path to Function Apps HTTP URL."
  type        = string
}

variable "source_subscriptionId" {
  description = "(Required) The Subscription ID where the VNET is you want to query."
  type        = string
}

variable "source_resourceGroupName" {
  description = "(Required) The Resource Group where the VNET is you want to query."
  type        = string
}

variable "source_virtualNetworkName" {
  description = "(Required) The Virtual Network Name where the VNET is you want to query."
  type        = string
}

variable "cidr" {
  description = "(Optional) The CIDR range you wish to provision."
  type        = string
  default     = "24"
}

variable "previous_block" {
  description = "(Optional) Previous CIDR Block if calling the module multiple times in one run. Default null"
  type        = string
  default     = ""
}

variable "service_endpoints" {
  description = "(Optional) Types of Service Endpoints. Default: [Microsoft.KeyVault, Microsoft.Storage]"
  type        = list(string)
  default     = ["Microsoft.KeyVault", "Microsoft.Storage"]
}

variable "server_farm_delegation" {
  description = "(Optional) Should you enable Server Farm Delegation?"
  type        = bool
  default     = false
}

variable "env_stage" {
  description = "(Optional) The environment stage. Example: development, qa, or production."
  type        = string
  default     = "development"
}

variable "env_stage_abbr" {
  description = "(Optional) The environment stage abbreviation. Example: dev, qa, or prd."
  type        = string
  default     = "dev"
}

variable "region" {
  description = "(Optional) The name of the region. Example: southcentralus."
  type        = string
  default     = "southcentralus"
}

variable "region_abbr" {
  description = "(Optional) The region abbreviation. Example: wus, eus, scus"
  type        = string
  default     = "scus"
}
