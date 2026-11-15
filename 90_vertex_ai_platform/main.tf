provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name = "vertex-ai-base"
  region       = "us-central1"
  zone         = "us-central1-a"
}

module "google_cloud_storage" {
  source       = "./modules/google_cloud_storage"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
}

module "google_vertex_ai" {
  source             = "./modules/google_vertex_ai"
  project_id         = var.project_id
  service_name       = local.service_name
  region             = local.region
  zone               = local.zone
  contents_delta_uri = module.google_cloud_storage.embeddings_uri
}
