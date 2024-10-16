provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "sops" {}

terraform {
  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "1.0.0"
    }
    helm = {
      version = "2.11.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.44.0"
    }
  }

  required_version = "1.6.4"

  cloud {
    organization = "kvanzuijlen"

    workspaces {
      name = "homelab"
    }
  }
}
