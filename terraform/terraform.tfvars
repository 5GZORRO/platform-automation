# ID of the subscription where all the components will be deployed
subscription_id = "f8948095-f2ff-4dbd-aa56-d319a3c81cf1"
# Tags that will be applied to all resources
tags = {
  "project"     = "5gzorro"
  "unit"        = "DSL"
  "cost-centre" = "DS001"
  "job-order"   = "IT001-0101362"
}
# Public SSH key will be injected in the VM and in all Kubernertes Node useful for debugging
ssh_public_key = "5gzorro.pub"
# DNS prefix used by AKS api server endpoint
dns_prefix = "project5gzorro"
# AKS cluster name
cluster_name = "5gzorro"
# Resource group name
resource_group_name = "5gzorro"
# Resource location 
location = "germanywestcentral"
# Default node pool count
default_node_pool_count = 4
# Default node pool name
default_node_pool_name = "system"
# Defult node pool VM size 
default_node_pool_size = "Standard_D4s_v5"
# Additional node pool name 
scale_node_pool_name = "scale"
# Additional node pool VM size
scale_node_pool_size = "Standard_D8s_v5"
# Additiional node pool count 
scale_node_pool_count = 3

# Kubernetes Version 
kubernetes_version = "1.23.12"
# Max pod numeber per node 
max_pods = 250
# Domain name user for azure dns zone and for all kubernetes ingresses
domain_name = "5gzorro.smartcommunitylab.it"

# VMS
# Public ip Name
public_ip_name = "publicIpVonNetwork"
# Network security group name
nsg_name = "nsgVonNetwork"
# VM account username
username = "zorro"
# VM hostname
computer_name = "von"
# VM name
vm_name = "vmVonNetwork"
# VM size
vm_size = "Standard_D4s_v5"
# Network Card Name
nic_name = "nicVonNetwork"
# Ansible Script
ansible_script = "install-von-network-and-corda.yaml"
# SSH private used by ansible to configure the VM
ssh_private_key = "/home/ffais/Documenti/users/5gzorro"

# HELM
# Helm values file
values-file-path = "5gzorro-platform-values.yaml.tftpl"
