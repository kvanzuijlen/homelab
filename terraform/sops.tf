data "sops_file" "argocd-secrets" {
  source_file = "./charts/argocd/secrets.yaml"
}
