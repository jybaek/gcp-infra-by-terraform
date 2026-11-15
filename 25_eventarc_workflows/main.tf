provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name = "eventarc-wf"
  region       = "us-central1"
}

module "google_cloud_storage" {
  source       = "./modules/google_cloud_storage"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
}

module "google_workflows" {
  source       = "./modules/google_workflows"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
}

module "google_eventarc" {
  source       = "./modules/google_eventarc"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
  bucket_name  = module.google_cloud_storage.bucket_name
  workflow_id  = module.google_workflows.workflow_id
}
