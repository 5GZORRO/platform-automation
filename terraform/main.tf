terraform {
  backend "http" {
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}


module "commons" {
  source = "./modules/commons"

  subscription_id     = var.subscription_id
  tags                = var.tags
  resource_group_name = var.resource_group_name
  location            = var.location

}

module "vms" {
  source = "./modules/vms"

  subscription_id     = var.subscription_id
  resource_group_name = var.resource_group_name
  tags                = var.tags
  location            = var.location
  ssh_public_key      = var.ssh_public_key
  public_ip_name      = var.public_ip_name
  nsg_name            = var.nsg_name
  vms_default_id      = module.commons.vms_default_id
  username            = var.username
  computer_name       = var.computer_name
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  nic_name            = var.nic_name
  ansible_script      = var.ansible_script
  depends_on          = [module.commons]
  ssh_private_key     = var.ssh_private_key
}

module "aks" {
  source = "./modules/aks"

  subscription_id        = var.subscription_id
  tags                   = var.tags
  node_count             = var.node_count
  ssh_public_key         = var.ssh_public_key
  dns_prefix             = var.dns_prefix
  cluster_name           = var.cluster_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  default_node_pool_name = var.default_node_pool_name
  default_node_pool_size = var.default_node_pool_size
  kubernetes_version     = var.kubernetes_version
  max_pods               = var.max_pods
  aks_default_id         = module.commons.aks_default_id
  identity_id            = module.commons.identity_id
  client_id              = module.commons.client_id
  object_id              = module.commons.object_id

  depends_on = [module.commons.azurerm_user_assigned_identity, module.commons.azurerm_subnet]
}

# provider "helm" {
#   kubernetes {
#     host = module.aks.host

#     client_certificate     = base64decode(module.aks.client_certificate)
#     client_key             = base64decode(module.aks.client_key)
#     cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
#   }
# }

# module "helm" {
#   source = "./modules/helm"

#   values-file-path = var.values-file-path
# }