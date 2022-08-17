resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  resource_group_name = var.resource_group_name
  tags = var.tags
  location            = var.location
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.node_count
    vm_size    = var.default_node_pool_size
    max_pods   = 250
    vnet_subnet_id        = var.aks_default_id
  }

  identity {
    type = "UserAssigned"
    identity_ids = [var.identity_id]
  }
 
  kubelet_identity {
    user_assigned_identity_id = var.identity_id
    client_id = var.client_id
    object_id = var.object_id
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "azure"
    network_policy    = "calico"
  }

  lifecycle {
    ignore_changes = [
      kubelet_identity,
    ]
  }
}


