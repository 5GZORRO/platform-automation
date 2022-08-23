variable "subscription_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "default_node_pool_count" {
  default = 1
  type    = number
}

variable "ssh_public_key" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "default_node_pool_name" {
  type    = string
  default = "system-node-pool"
}

variable "default_node_pool_size" {
  type    = string
  default = "Standard_D4s_v5"
}

variable "scale_node_pool_name" {
  type    = string
}

variable "scale_node_pool_size" {
  type    = string
  default = "Standard_D4s_v5"
}

variable "scale_node_pool_count" {
  type    = number
  default = 1
}

variable "kubernetes_version" {
  type = string
}

variable "max_pods" {
  type    = number
  default = 250
}

variable "aks_default_id" {
  type = string
}


variable "identity_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "object_id" {
  type = string
}