provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name  = "llm-serving"
  region        = "us-central1"
  k8s_namespace = "default"
  k8s_sa_name   = "vllm-ksa"
}

module "google_compute_engine" {
  source       = "./modules/google_compute_engine"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
}

module "google_cloud_storage" {
  source       = "./modules/google_cloud_storage"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
}

module "google_kubernetes_engine" {
  source             = "./modules/google_kubernetes_engine"
  project_id         = var.project_id
  service_name       = local.service_name
  region             = local.region
  network_id         = module.google_compute_engine.network_id
  subnetwork_id      = module.google_compute_engine.subnetwork_id
  pods_range_name    = module.google_compute_engine.pods_range_name
  service_range_name = module.google_compute_engine.services_range_name
  model_bucket_name  = module.google_cloud_storage.bucket_name
  k8s_namespace      = local.k8s_namespace
  k8s_sa_name        = local.k8s_sa_name
}
