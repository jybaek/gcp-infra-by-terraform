provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name = "autopilot-gw"
  region       = "us-central1"
}

module "google_compute_engine" {
  source       = "./modules/google_compute_engine"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
}

module "google_kubernetes_engine" {
  source             = "./modules/google_kubernetes_engine"
  project_id         = var.project_id
  service_name       = local.service_name
  region             = local.region
  network_id         = module.google_compute_engine.google_compute_network_id
  subnetwork_id      = module.google_compute_engine.google_compute_subnetwork_id
  k8s_namespace      = "default"
  k8s_sa_name        = "${local.service_name}-ksa"
  pods_range_name    = module.google_compute_engine.pods_range_name
  service_range_name = module.google_compute_engine.services_range_name
}
