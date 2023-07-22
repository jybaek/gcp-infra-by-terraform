provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name = "airflow-project"
  region       = "us-central1"
}


module "google_compute_engine" {
  source       = "./modules/google_compute_engine"
  project_id   = var.project_id
  service_name = local.service_name
}

module "google_kubernetes_engine" {
  source       = "./modules/google_kubernetes_engine"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region

  google_compute_network_id    = module.google_compute_engine.google_compute_network_id
}
