provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name = "biglake-analytics"
  region       = "us-central1"
}

module "google_cloud_storage" {
  source       = "./modules/google_cloud_storage"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
}

module "google_bigquery" {
  source       = "./modules/google_bigquery"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
  bucket_name  = module.google_cloud_storage.bucket_name
  bucket_url   = module.google_cloud_storage.bucket_url
}

module "google_cloud_pubsub" {
  source             = "./modules/google_cloud_pubsub"
  project_id         = var.project_id
  service_name       = local.service_name
  dataset_id         = module.google_bigquery.dataset_id
  streaming_table_id = module.google_bigquery.streaming_table_id
}
