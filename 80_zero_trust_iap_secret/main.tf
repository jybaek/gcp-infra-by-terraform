provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name = "zero-trust"
  region       = "us-central1"
  zone         = "us-central1-a"
}

module "google_compute_engine" {
  source       = "./modules/google_compute_engine"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
  zone         = local.zone
}

module "google_secret_manager" {
  source             = "./modules/google_secret_manager"
  project_id         = var.project_id
  service_name       = local.service_name
  vm_service_account = module.google_compute_engine.vm_service_account_email
}

module "google_iap" {
  source            = "./modules/google_iap"
  project_id        = var.project_id
  service_name      = local.service_name
  accessor_sa_email = module.google_compute_engine.vm_service_account_email
}

module "google_compute_security" {
  source       = "./modules/google_compute_security"
  project_id   = var.project_id
  service_name = local.service_name
}
