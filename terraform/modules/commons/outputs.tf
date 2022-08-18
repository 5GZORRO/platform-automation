output "identity_principal_id" {
  value     = azurerm_user_assigned_identity.aks_identity.principal_id
  sensitive = true
}

output "identity_id" {
  value     = azurerm_user_assigned_identity.aks_identity.id
  sensitive = false
}

output "client_id" {
  value     = azurerm_user_assigned_identity.aks_identity.client_id
  sensitive = false
}

output "object_id" {
  value     = azurerm_user_assigned_identity.aks_identity.tenant_id
  sensitive = false
}

output "aks_default_id" {
  value = azurerm_subnet.aks-default.id
}

output "vms_default_id" {
  value = azurerm_subnet.vms-default.id
}


output "name_servers" {
  value = azurerm_dns_zone.default.name_servers
}