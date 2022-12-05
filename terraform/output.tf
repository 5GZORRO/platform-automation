output "identity_principal_id" {
  value     = module.commons.identity_principal_id
  sensitive = true
}

output "identity_id" {
  value     = module.commons.identity_id
  sensitive = false
}

output "identity_client_id" {
  value     = module.commons.identity_client_id
  sensitive = false
}

output "identity_object_id" {
  value     = module.commons.identity_object_id
  sensitive = false
}

output "aks_default_id" {
  value = module.commons.aks_default_id
}

output "vms_default_id" {
  value = module.commons.vms_default_id
}


output "dns_name_servers" {
  value = module.commons.dns_name_servers
}

output "client_key" {
  value     = module.aks.client_key
  sensitive = true
}

output "client_certificate" {
  value     = module.aks.client_certificate
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = module.aks.cluster_ca_certificate
  sensitive = true
}
