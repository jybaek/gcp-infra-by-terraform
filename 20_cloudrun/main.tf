provider "google" {}

variable "project_id" {
  type  = string
  description = "Enter a unique project-id"
}

locals {
  service_name  = "terraform"
  region        = "us-central1"
  zone          = "us-central1-a"
}

module "vpc_network" {
  source       = "./modules/vpc_network"
  project_id   = var.project_id
  service_name = local.service_name
}

module "google_artifact_registry_repository" {
  source       = "./modules/artifact_registry"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
}

module "cloud_run_basic" {
  source       = "./modules/cloud_run_basic"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
  repository   = module.google_artifact_registry_repository.google_artifact_registry_repository
}