# -----------------------------------------------------------------------------
# Provider
# -----------------------------------------------------------------------------
provider "google" {
  project = var.project_id
}

# -----------------------------------------------------------------------------
# VPC & Private Services Access for AlloyDB + Direct VPC Egress Subnet
# -----------------------------------------------------------------------------
module "google_compute_engine" {
  source       = "./modules/google_compute_engine"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
}

module "google_service_networking" {
  source                  = "./modules/google_service_networking"
  network_id              = module.google_compute_engine.vpc_network_id
  reserved_peering_ranges = module.google_compute_engine.private_ip_alloc_name
}

# -----------------------------------------------------------------------------
# AlloyDB Vector Store (pgvector / AlloyDB AI)
# -----------------------------------------------------------------------------
module "google_alloydb" {
  source       = "./modules/google_alloydb"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
  network_id   = module.google_compute_engine.vpc_network_id
  labels       = local.labels
  depends_on   = [module.google_service_networking]
}

# -----------------------------------------------------------------------------
# Cloud Storage Knowledge Base Bucket
# -----------------------------------------------------------------------------
module "google_cloud_storage" {
  source       = "./modules/google_cloud_storage"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
}
