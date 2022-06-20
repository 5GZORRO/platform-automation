terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

resource "azurerm_resource_group" "k8s" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

data "azuread_client_config" "current" {}

resource "azuread_application" "k8s" {
  display_name = "${var.cluster_name}-sp"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "k8s" {
  application_id               = azuread_application.k8s.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal_password" "k8s" {
  service_principal_id = azuread_service_principal.k8s.id
}

resource "azurerm_role_assignment" "k8s" {
  scope                = azurerm_resource_group.k8s.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.k8s.id
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = azurerm_resource_group.k8s.location
  resource_group_name = azurerm_resource_group.k8s.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  linux_profile {
      admin_username = "ubuntu"

      ssh_key {
          key_data = file(var.ssh_public_key)
      }
  }

  default_node_pool {
      name            = var.default_node_pool_name
      node_count      = var.node_count
      vm_size         = var.default_node_pool_size
      max_pods = 250
  }

  service_principal {
      client_id     = azuread_application.k8s.application_id
      client_secret = azuread_service_principal_password.k8s.value
  }

  network_profile {
      load_balancer_sku = "Standard"
      network_plugin = "azure"
      network_policy = "calico"
  }

  depends_on = [azurerm_role_assignment.k8s]
}

