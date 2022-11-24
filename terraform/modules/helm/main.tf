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
    BEVEL_GIT_URL               = var.bevel_git_url
    BEVEL_REPO_URL              = var.bevel_repo_url
    BEVEL_REPO_USERNAME         = var.bevel_repo_username
    BEVEL_REPO_PASSWORD         = var.bevel_repo_password
    BEVEL_REPO_EMAIL            = var.bevel_repo_email
    BEVEL_URL_SUFFIX            = var.bevel_url_suffix
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
