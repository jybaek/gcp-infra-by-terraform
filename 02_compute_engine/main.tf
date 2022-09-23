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

  region       = local.region
  zone         = local.zone
  machine_type = "e2-micro" # 2 vCPU, 1 GB memory

  tags = local.tags
  metadata = {
    foo = "bar"
  }
  metadata_startup_script      = "echo hi > /test.txt"
  google_service_account_email = module.gcp_cloud_platform.google_service_account_email
}
