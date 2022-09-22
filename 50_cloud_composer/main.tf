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

module "google_compute_engine" {
  source                  = "./modules/google_compute_engine"
  auto_create_subnetworks = false
  ip_cidr_range           = "10.2.0.0/16"
  project_id              = var.project_id
  region                  = local.region
  service_name            = local.service_name
}

module "google_cloud_platform" {
  source       = "./modules/google_cloud_platform"
  account_id   = "composer-env-account"
  display_name = "Test Service Account for Composer Environment"
  project_id   = var.project_id
  iam_role     = "roles/composer.worker"
}

module "google_cloud_composer" {
  source                       = "./modules/google_cloud_composer"
  environment_size             = "ENVIRONMENT_SIZE_SMALL"
  google_compute_network_id    = module.google_compute_engine.google_compute_network_id
  google_compute_subnetwork_id = module.google_compute_engine.google_compute_subnetwork_id
  google_service_account_name  = module.google_cloud_platform.google_service_account_name
  project_id                   = var.project_id
  region                       = local.region
  service_name                 = local.service_name
}
