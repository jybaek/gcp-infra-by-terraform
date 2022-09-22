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
  environment  = "dev"
  tags         = ["alice", "bob"]
}

module "gcp_cloud_platform" {
  source       = "./modules/google_cloud_platform"
  project_id   = var.project_id
  account_id   = "compute-engine-account"
  display_name = "Test Service Account for Compute Engine"
}

module "gcp_compute_engine" {
  source       = "./modules/google_compute_engine"
  project_id   = var.project_id
  service_name = local.service_name

  region               = local.region
  zone                 = local.zone
  network              = module.gcp_compute_engine.vpc_network_id
  machine_type         = "e2-micro" # 2 vCPU, 1 GB memory
  instance_template_id = module.gcp_compute_engine.google_compute_instance_template_id
  instance_group_id    = module.gcp_compute_engine.google_compute_instance_group_manager_id
  email                = module.gcp_cloud_platform.google_service_account_email

  environment = local.environment
  tags        = local.tags
  metadata = {
    foo = "bar"
  }
}
