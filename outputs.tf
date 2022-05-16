
data "azurerm_key_vault" "keyvault" {
  name                = local.key_vault_name
  resource_group_name = local.rg_name
}

output "vault_uri" {
  value = data.azurerm_key_vault.keyvault.vault_uri
}

data "azurerm_key_vault_secret" "secret" {
  name         = local.secret_name
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

output "secret_value" {
  value     = data.azurerm_key_vault_secret.secret.value
  sensitive = false
}