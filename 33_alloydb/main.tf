provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name = "alloydb-cluster"
  region       = "us-central1"
  zone         = "us-central1-a"
}

module "google_compute_engine" {
  source       = "./modules/google_compute_engine"
  service_name = local.service_name
}

module "google_service_networking" {
  source                  = "./modules/google_service_networking"
  network                 = module.google_compute_engine.vpc_network_id
  reserved_peering_ranges = module.google_compute_engine.google_compute_global_address_name
}

module "google_alloydb" {
  source           = "./modules/google_alloydb"
  project_id       = var.project_id
  service_name     = local.service_name
  location         = local.region
  vpc_network_name = module.google_compute_engine.vpc_network_name
  instance_type    = "PRIMARY"
  cpu_count        = 2
  labels = {
    test = "alloydb-cluster"
  }
}
