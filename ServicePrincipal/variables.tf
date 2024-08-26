#variable service_principal_name {
#    type = string
#}

variable "AZURE_SUBSCRIPTION_ID" {
  description = "Azure subscription ID"
  type        = string
}

variable "CLIENT_ID" {
  description = "Client ID for the service principal"
  type        = string
}

variable "CLIENT_SECRET" {
  description = "Client secret for the service principal"
  type        = string
  sensitive   = true
}

variable "SERVICE_PRINCIPAL_TENANT_ID" {
  description = "Tenant ID for the service principal"
  type        = string
}

variable "service_principal_name" {
  description = "The name of the service principal"
  type        = string
}

