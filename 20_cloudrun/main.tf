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
  zone         = "us-central1-a"
}

module "google_artifact_registry_repository" {
  source       = "./modules/google_artifact_registry"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
}

module "google_cloud_run" {
  source       = "./modules/google_cloud_run"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
  repository   = module.google_artifact_registry_repository.google_artifact_registry_repository
}