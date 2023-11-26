resource "helm_release" "ingress-nginx" {
  chart             = "./charts/ingress-nginx"
  name              = "ingress-nginx"
  namespace         = "ingress-nginx"
  dependency_update = true
  atomic            = true
  create_namespace  = true
}
