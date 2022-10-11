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
  type = string
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

variable "values-file-path" {
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "nic_name" {
  type = string
}

variable "username" {
  type = string
}

variable "computer_name" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "ansible_script" {
  type = string
}

variable "ssh_private_key" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "registry" {
  type = string
}

variable "azure_tenant_id" {
  type = string
}

variable "zerossl_hmac" {
  type    = string
  default = ""
}

variable "zerossl_kid" {
  type    = string
  default = ""
}

variable "registry_url" {
  type    = string
  default = ""
}

variable "registry_username" {
  type    = string
  default = ""
}

variable "registry_password" {
  type    = string
  default = ""
}
