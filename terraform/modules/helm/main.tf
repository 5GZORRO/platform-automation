data "template_file" "valuesfile" {
  template = file("${var.values-file-path}")
  vars = {
    SUBSCRIPTION_ID             = var.subscription_id
    RESOURCE_GROUP_NAME         = var.resource_group_name
    HOSTED_ZONE_NAME            = var.domain_name
    MANAGEND_IDENTITY_CLIENT_ID = var.client_id
    AZURE_TENANT_ID             = var.azure_tenant_id
    EAB_KID                     = var.zerossl_kid
    REGISTRY_URL                = var.registry_url
    REGISTRY_PASSWORD           = var.registry_password
    REGISTRY_USERNAME           = var.registry_username
  }
}

resource "local_file" "valuesfile" {
  content  = data.template_file.valuesfile.rendered
  filename = replace(var.values-file-path, ".tftpl", "")
}

resource "helm_release" "platform-5gzorro" {
  name       = "zorro5g"
  repository = "../helm"
  chart      = "platform-5gzorro"
  timeout    = 1800
  wait       = false
  values = [
    data.template_file.valuesfile.rendered
  ]
}
