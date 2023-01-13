

variable "tenant_id" {
  description = "(Required) Service Principal AD Tenant ID - Azure AD for terraform authentication."
  type        = string
}

variable "subscription_id" {
  description = "(Required) Azure Subscription Id used to connect to AzureRM provider."
  type        = string
}

variable "client_id" {
  description = "(Required) Service Principal App ID - Azure AD for terraform authentication."
  type        = string
}

variable "client_secret" {
  description = "(Required) Service Principal Client Secret - Azure AD for terraform authentication."
  type        = string
}