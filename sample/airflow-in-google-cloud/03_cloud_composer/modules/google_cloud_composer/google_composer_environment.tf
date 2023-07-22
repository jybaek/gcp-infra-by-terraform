resource "google_composer_environment" "this" {
  project = var.project_id
  name    = var.service_name
  region  = var.region
  config {
    software_config {
      image_version = "composer-2-airflow-2"
    }

    environment_size = var.environment_size

    node_config {
      network         = var.google_compute_network_id
      subnetwork      = var.google_compute_subnetwork_id
      service_account = var.google_service_account_name
    }
  }
}