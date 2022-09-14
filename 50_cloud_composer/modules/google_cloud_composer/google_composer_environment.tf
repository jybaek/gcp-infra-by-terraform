resource "google_composer_environment" "this" {
  project = var.project_id
  name    = var.service_name
  region  = var.region
  config {
    software_config {
      image_version = "composer-2-airflow-2"
    }

    workloads_config {
      scheduler {
        cpu        = 0.5
        memory_gb  = 1.875
        storage_gb = 1
        count      = 1
      }
      web_server {
        cpu        = 0.5
        memory_gb  = 1.875
        storage_gb = 1
      }
      worker {
        cpu        = 0.5
        memory_gb  = 1.875
        storage_gb = 1
        min_count  = 1
        max_count  = 3
      }
    }
    environment_size = var.environment_size

    node_config {
      network         = var.google_compute_network_id
      subnetwork      = var.google_compute_subnetwork_id
      service_account = var.google_service_account_name
    }
  }
}