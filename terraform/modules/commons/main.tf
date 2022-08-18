# Create Resorce Group
resource "azurerm_resource_group" "k8s" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# Create AKS Managed Identity
resource "azurerm_user_assigned_identity" "aks_identity" {
  name                = "aks-identity"
  resource_group_name = azurerm_resource_group.k8s.name
  location            = var.location
  tags                = var.tags
}

resource "azurerm_dns_zone" "default" {
  name                = var.domain_name
  resource_group_name = azurerm_resource_group.k8s.name
  tags                = var.tags
}

# Assign role Contributor to AKS Managed Identity on Resource Group
resource "azurerm_role_assignment" "k8s" {
  scope                = azurerm_resource_group.k8s.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.aks_identity.principal_id

  depends_on = [azurerm_user_assigned_identity.aks_identity]
}

# Create Virtual Network
resource "azurerm_virtual_network" "aksvnet" {
  name                = "aks-network"
  resource_group_name = azurerm_resource_group.k8s.name
  location            = azurerm_resource_group.k8s.location
  tags                = var.tags
  address_space       = ["10.0.0.0/8"]
}

# Create a Subnet for AKS
resource "azurerm_subnet" "aks-default" {
  name                 = "aks-default-subnet"
  resource_group_name  = azurerm_resource_group.k8s.name
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  address_prefixes     = ["10.240.0.0/16"]
}

# Create a Subnet for VMS
resource "azurerm_subnet" "vms-default" {
  name                 = "vms-default-subnet"
  resource_group_name  = azurerm_resource_group.k8s.name
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  address_prefixes     = ["10.241.0.0/16"]
}