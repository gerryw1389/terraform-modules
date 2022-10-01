
variable "resource_group_name" {
  description = "(Required) Name of the Azure Resource Group."
  type        = string
}

variable "location" {
  description = "(Required) Location where the Vnet resides. Example: WestUS"
  type        = string
}

variable "tags" {
  description = "(Optional) Tags associated with an Azure Resource. Default: { Owner = Automation Admin }"
  type        = map(string)
  default = {
    Owner      = "Automation Admin"
    CostCenter = "100"
    EntAppname = "Automation Admin Terraform POC"
    Appenv     = var.env_stage
    Apppoc     = "gerry@automationadmin.com"
  }
}
