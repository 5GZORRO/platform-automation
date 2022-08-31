resource "helm_release" "platform-5gzorro" {
  name       = "zorro5g"
  repository = "../helm"
  chart      = "platform-5gzorro"
  timeout    = 600
  values = [
    file(var.values-file-path)
  ]
}