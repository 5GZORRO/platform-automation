resource "helm_release" "platform-5gzorro" {
  name       = "platform-5gzorro"
  repository = "../charts"
  chart      = "platform-5gzorro"

  values = [
    file(var.values-file-path)
  ]
}