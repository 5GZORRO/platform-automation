terraform {
  backend "http" {
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}


module "commons" {
  source = "./modules/commons"

  subscription_id     = var.subscription_id
  tags                = var.tags
  resource_group_name = var.resource_group_name
  location            = var.location
  domain_name         = var.domain_name

}

module "vms" {
  source = "./modules/vms"

  subscription_id     = var.subscription_id
  resource_group_name = var.resource_group_name
  tags                = var.tags
  location            = var.location
  ssh_public_key      = var.ssh_public_key
  public_ip_name      = var.public_ip_name
  nsg_name            = var.nsg_name
  vms_default_id      = module.commons.vms_default_id
  username            = var.username
  computer_name       = var.computer_name
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  nic_name            = var.nic_name
  ansible_script      = var.ansible_script
  ssh_private_key     = var.ssh_private_key

  depends_on = [module.commons]
}

module "aks" {
  source = "./modules/aks"

  subscription_id         = var.subscription_id
  tags                    = var.tags
  ssh_public_key          = var.ssh_public_key
  dns_prefix              = var.dns_prefix
  cluster_name            = var.cluster_name
  resource_group_name     = var.resource_group_name
  location                = var.location
  default_node_pool_count = var.default_node_pool_count
  default_node_pool_name  = var.default_node_pool_name
  default_node_pool_size  = var.default_node_pool_size
  scale_node_pool_name    = var.scale_node_pool_name
  scale_node_pool_size    = var.scale_node_pool_size
  scale_node_pool_count   = var.scale_node_pool_count
  kubernetes_version      = var.kubernetes_version
  max_pods                = var.max_pods
  aks_default_id          = module.commons.aks_default_id
  identity_id             = module.commons.identity_id
  client_id               = module.commons.identity_client_id
  object_id               = module.commons.identity_object_id

  depends_on = [module.commons, module.commons, module.vms]
}

provider "kubernetes" {
  host                   = module.aks.host
  client_certificate     = base64decode(module.aks.client_certificate)
  client_key             = base64decode(module.aks.client_key)
  cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
}

resource "kubernetes_secret" "kube_config" {
  metadata {
    name = "kubeconfig"
  }
  data = {
    "config" = module.aks.kube_config
  }
  type       = "Opaque"
  depends_on = [module.aks]
}

resource "kubernetes_secret" "zerossl-secret" {
  count = var.zerossl_hmac != "" ? 1 : 0
  metadata {
    name      = "zerossl-eabsecret"
    namespace = "cert-manager"
  }
  data = {
    "secret" = var.zerossl_hmac
  }
  type       = "Opaque"
  depends_on = [module.aks, module.helm]
}

resource "kubernetes_secret" "registry" {
  metadata {
    name = "registry-credentials"
  }
  data = {
    ".dockerconfigjson" = file("${var.registry}")
  }

  type       = "kubernetes.io/dockerconfigjson"
  depends_on = [module.aks]
}

provider "helm" {
  kubernetes {
    host                   = module.aks.host
    client_certificate     = base64decode(module.aks.client_certificate)
    client_key             = base64decode(module.aks.client_key)
    cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
  }
}

module "helm" {
  source = "./modules/helm"

  values-file-path    = var.values-file-path
  subscription_id     = var.subscription_id
  resource_group_name = var.resource_group_name
  domain_name         = var.domain_name
  client_id           = module.commons.identity_client_id
  azure_tenant_id     = var.azure_tenant_id
  zerossl_kid         = var.zerossl_kid
  depends_on          = [module.aks, kubernetes_secret.registry, kubernetes_secret.kube_config, null_resource.install_osm]
}

resource "null_resource" "upload-kube-config" {
  provisioner "file" {
    content     = module.aks.kube_config
    destination = "/home/zorro/config"
  }
  connection {
    host        = module.vms.vmIp
    type        = "ssh"
    user        = var.username
    private_key = file(var.ssh_private_key)
    agent       = "false"
  }
  depends_on = [module.aks, module.vms]
}

resource "null_resource" "install_osm" {
  provisioner "remote-exec" {
    inline = [
      "wget https://osm-download.etsi.org/ftp/osm-10.0-ten/install_osm.sh",
      "chmod +x install_osm.sh",
      "./install_osm.sh --charmed --k8s /home/zorro/config --nohostclient"
    ]
  }
  connection {
    host        = module.vms.vmIp
    type        = "ssh"
    user        = var.username
    private_key = file(var.ssh_private_key)
    agent       = "false"
  }
  depends_on = [null_resource.upload-kube-config]
}

resource "null_resource" "patch-ingress" {
  provisioner "remote-exec" {
    script = "./kubernetes-patch.sh"
  }
  connection {
    host        = module.vms.vmIp
    type        = "ssh"
    user        = var.username
    private_key = file(var.ssh_private_key)
    agent       = "false"
  }
  depends_on = [module.helm]
}
