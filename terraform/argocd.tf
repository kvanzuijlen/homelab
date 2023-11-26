resource "helm_release" "argocd" {
  chart             = "./charts/argocd"
  name              = "argocd"
  namespace         = "argocd"
  dependency_update = true
  atomic            = true
  create_namespace  = true

  values = [
    file("charts/argocd/values.yaml"),
    data.sops_file.argocd-secrets.raw,
  ]

  set {
    name  = "argo-cd.server.ingress.ingressClassName"
    value = "nginx"
  }

  depends_on = [
    helm_release.ingress-nginx,
  ]
}
