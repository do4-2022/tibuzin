module "k3d-cluster" {
  source = "../modules/k3d-cluster"
}

module "create-namespaces" {
  source = "../modules/create-namespaces"

  cluster_config_endpoint               = module.k3d-cluster.config_endpoint
  cluster_config_cluster_ca_certificate = module.k3d-cluster.config_cluster_ca_certificate
  cluster_config_client_certificate     = module.k3d-cluster.config_client_certificate
  cluster_config_client_key             = module.k3d-cluster.config_client_key
}

module "flux-bootstrap" {
  source = "../modules/flux-bootstrap"

  cluster_config_endpoint               = module.k3d-cluster.config_endpoint
  cluster_config_cluster_ca_certificate = module.k3d-cluster.config_cluster_ca_certificate
  cluster_config_client_certificate     = module.k3d-cluster.config_client_certificate
  cluster_config_client_key             = module.k3d-cluster.config_client_key

  cluster_environment = "local"
}
