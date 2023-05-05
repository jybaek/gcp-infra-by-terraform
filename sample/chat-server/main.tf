# -----------------------------------------------------------------------------
# provider
# -----------------------------------------------------------------------------
provider "google" {
  project = var.project_id
}

# -----------------------------------------------------------------------------
# Memorystore
# -----------------------------------------------------------------------------
module "google_compute_engine" {
  source = "./modules/google_compute_engine"
  name   = "${local.service_name}-network"
}

module "google_redis_instance" {
  source            = "./modules/google_cloud_redis"
  network_id        = module.google_compute_engine.google_compute_network_id
  region            = local.region
  redis_name        = "${local.service_name}-memory-cache"
  tier              = "BASIC"
  redis_version     = "REDIS_6_X"
  display_name      = "Terraform Test Instance"
  reserved_ip_range = "192.168.0.0/29"

  labels = local.labels
}

# -----------------------------------------------------------------------------
# Serverless vpc access
# -----------------------------------------------------------------------------
module "google_serverless_vpc_access" {
  source        = "./modules/google_serverless_vpc_access"
  vpc_conn_name = "${local.service_name}-vpc-con"
  region        = local.region
}