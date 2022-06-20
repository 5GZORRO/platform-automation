variable "subscription_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "node_count" {
  default = 1
  type = number
}

variable "ssh_public_key" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable cluster_name {
  type = string
}

variable resource_group_name {
  type = string
}

variable location {
  type = string
}

variable "default_node_pool_name" {
  type = string
  default = "system-node-pool"  
}

variable "default_node_pool_size" {
  type = string
  default = "Standard_D4s_v5"  
}

variable "kubernetes_version" {
  type = string  
}

variable "max_pods" {
  type = number
  default = 250  
}