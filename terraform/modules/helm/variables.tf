variable "values-file-path" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "client_id" {
  type = string
}

variable "azure_tenant_id" {
  type = string
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
