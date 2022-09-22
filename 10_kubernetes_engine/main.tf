provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name = "terraform"
  region       = "us-central1"
}


module "google_cloud_platform" {
  source       = "./modules/google_cloud_platform"
  project_id   = var.project_id
  service_name = local.service_name
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
  machine_type = "e2-medium" # 2 vCPU, 4 GB memory

  google_compute_network_id    = module.google_compute_engine.google_compute_network_id
  google_service_account_email = module.google_cloud_platform.google_service_account_email
}
