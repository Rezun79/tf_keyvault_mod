# resource "azurerm_key_vault_secret" "top-secret2" {
#   name         = "top-secret2"
#   value        = data.azurerm_key_vault_secret.secret.value
#   key_vault_id = data.azurerm_key_vault.keyvault.id
# }
data "azuread_service_principal" "rg_spn" {
  application_id = local.root_spn_client_id
}

resource "azurerm_key_vault" "rg_keyvault" {
  name                        = "${local.rg_name}keyvault"
  location                    = "West Europe"
  resource_group_name         = local.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = local.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"
    access_policy {
    tenant_id = local.tenant_id
    object_id = local.spn_object_id
    
    key_permissions = [
    ]

    secret_permissions = [
      "Get",
      "Set"
    ]

    storage_permissions = [
    ]
  }
}


data "azurerm_key_vault" "rg_platform_keyvault" {
  name                = local.platform_keyvault
  resource_group_name = local.platform_rg
}
resource "azurerm_key_vault_secret" "rg_spn_secret" {
  name         = "${local.rg_name}${local.spn_client_id}"
  value        = "${local.secret}"
  key_vault_id = data.azurerm_key_vault.rg_platform_keyvault.id
}
