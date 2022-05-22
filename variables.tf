# variable "key_vault_rg_name" {
# }

# variable "key_vault_name" {
# }
variable "root_spn_client_id" {
  
}
variable "spn_client_id" {
}

variable "spn_object_id" {
}
variable "secret" {
}

variable "rg_name" {
}
variable "tenant_id" {
  
}

variable "platform_rg" {
  type = string
  default = null
}

variable "platform_keyvault" {
  type = string
  default = null
}