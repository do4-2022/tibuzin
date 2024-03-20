resource "helm_release" "this" {
  name = "flux2"

  repository = "https://fluxcd-community.github.io/helm-charts"
  chart      = "flux2"

  namespace = "flux-system"
  wait      = true
}

resource "helm_release" "sync" {
  name = "tibuzin"

  repository = "https://fluxcd-community.github.io/helm-charts"
  chart      = "flux2-sync"

  namespace = "flux-system"
  wait      = true

  ## Git Repository
  set {
    name  = "gitRepository.spec.url"
    value = "https://github.com/do4-2022/tibuzin"
  }

  set {
    name  = "gitRepository.spec.interval"
    value = "5m"
  }

  set {
    name  = "gitRepository.spec.ref.branch"
    value = "main"
  }

  ## Kustomization Repository
  set {
    name  = "kustomization.spec.interval"
    value = "5m"
  }

  set {
    name  = "kustomization.spec.prune"
    value = "true"
  }

  set {
    name  = "kustomization.spec.wait"
    value = "true"
  }

  set {
    name  = "kustomization.spec.path"
    value = "clusters/${var.cluster_environment}"
  }

  depends_on = [helm_release.this]
}
