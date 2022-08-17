variable "subscription_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "ssh_public_key" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
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

variable "vms_default_id" {
  type = string
}

variable "ansible_script" {
  type = string
}

variable "ssh_private_key" {
  type = string
}