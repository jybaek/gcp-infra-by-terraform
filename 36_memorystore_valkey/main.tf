provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name = "valkey-cache"
  region       = "us-central1"
}

module "google_compute_engine" {
  source       = "./modules/google_compute_engine"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
}

module "google_network_connectivity" {
  source        = "./modules/google_network_connectivity"
  project_id    = var.project_id
  service_name  = local.service_name
  region        = local.region
  network_id    = module.google_compute_engine.network_id
  subnetwork_id = module.google_compute_engine.subnetwork_id
}

module "google_memorystore" {
  source        = "./modules/google_memorystore"
  project_id    = var.project_id
  service_name  = local.service_name
  region        = local.region
  network_id    = module.google_compute_engine.network_id
  psc_policy_id = module.google_network_connectivity.policy_id
  depends_on    = [module.google_network_connectivity]
}
