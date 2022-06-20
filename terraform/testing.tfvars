subscription_id = "f8948095-f2ff-4dbd-aa56-d319a3c81cf1"
tags = {
  "project" = "5gzorro"
  "unit"    = "DSL"
  "cost-centre" = "DS001"
  "job-order" = "IT001-0101362"
}
node_count = 2
ssh_public_key = "~/Documenti/public/5gzorro.pub"
dns_prefix = "project5gzorro"
cluster_name = "5gzorro"
resource_group_name = "5gzorro"
location = "germanywestcentral"
default_node_pool_name = "system"
default_node_pool_size = "Standard_D4s_v5"
kubernetes_version = "1.23.5"
max_pods = 250

values-file-path = "5gzorro-platform-values.yaml"