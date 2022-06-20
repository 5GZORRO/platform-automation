provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
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
}

provider "helm" {
  kubernetes {
    host = module.aks.host

    client_certificate     = base64decode(module.aks.client_certificate)
    client_key             = base64decode(module.aks.client_key)
    cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
  }
}

module "helm" {
  source = "./modules/helm"

  values-file-path = var.values-file-path
}