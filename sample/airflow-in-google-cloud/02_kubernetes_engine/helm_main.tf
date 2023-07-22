data "google_client_config" "default" {}

provider "helm" {
  kubernetes {
    host                   = module.google_kubernetes_engine.endpoint
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(module.google_kubernetes_engine.cluster_ca_certificate)
  }
}

resource "helm_release" "airflow" {
  name             = "airflow"
  repository       = "https://airflow.apache.org"
  chart            = "airflow"
  version          = "1.9.0"
  namespace        = "airflow"
  create_namespace = true
  wait             = false

  depends_on = [
    module.google_kubernetes_engine
  ]
}
