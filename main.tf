resource "azurerm_key_vault_secret" "top-secret" {
  name         = "top-secret"
  value        = "${data.azurerm_key_vault_secret.secret}"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}