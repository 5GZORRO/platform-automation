subscription_id = "f8948095-f2ff-4dbd-aa56-d319a3c81cf1"
tags = {
  "project"     = "5gzorro"
  "unit"        = "DSL"
  "cost-centre" = "DS001"
  "job-order"   = "IT001-0101362"
}
ssh_public_key          = "5gzorro.pub"
dns_prefix              = "project5gzorro"
cluster_name            = "5gzorro"
resource_group_name     = "5gzorro"
location                = "germanywestcentral"
default_node_pool_count = 2
default_node_pool_name  = "system"
default_node_pool_size  = "Standard_D4s_v5"
scale_node_pool_name    = "scale"
scale_node_pool_size    = "Standard_D8s_v5"
scale_node_pool_count   = 3

kubernetes_version = "1.22.11"
max_pods           = 250
domain_name        = "5gzorro.smartcommunitylab.it"

# VMS
public_ip_name  = "publicIpVonNetwork"
nsg_name        = "nsgVonNetwork"
username        = "zorro"
computer_name   = "von"
vm_name         = "vmVonNetwork"
vm_size         = "Standard_D4s_v5"
nic_name        = "nicVonNetwork"
ansible_script  = "install-von-network-and-corda.yaml"
ssh_private_key = "/home/ffais/Documenti/users/5gzorro"

# HELM
values-file-path = "5gzorro-platform-values.yaml.tftpl"
