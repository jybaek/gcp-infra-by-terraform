provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name = "cloudrun-v2"
  region       = "us-central1"
}

module "google_compute_engine" {
  source       = "./modules/google_compute_engine"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
}

module "google_cloud_run_v2" {
  source          = "./modules/google_cloud_run_v2"
  project_id      = var.project_id
  service_name    = local.service_name
  region          = local.region
  network_name    = module.google_compute_engine.network_name
  subnetwork_name = module.google_compute_engine.subnetwork_name
}
