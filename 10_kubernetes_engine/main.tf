provider "google" {}

variable "project_id" {
  type  = string
  description = "Enter a unique project-id"
}

locals {
  service_name  = "terraform"
  region        = "us-central1"
}


module "vpc_network" {
  source       = "./modules/vpc_network"
  project_id   = var.project_id
  service_name = local.service_name
}

module "google_service_account" {
  source       = "./modules/google_service_account"
  project_id   = var.project_id
  service_name = local.service_name
}

module "google_container_cluster" {
  source       = "./modules/google_container_cluster"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region

  google_compute_network_id = module.vpc_network.google_compute_network_id
}

module "google_container_node_pool" {
  source       = "./modules/google_container_node_pool"
  project_id   = var.project_id
  service_name = local.service_name

  machine_type = "e2-medium" # 2 vCPU, 4 GB memory

  google_service_account_email = module.google_service_account.google_service_account_email
  google_container_cluster_id  = module.google_container_cluster.google_container_cluster_id
}