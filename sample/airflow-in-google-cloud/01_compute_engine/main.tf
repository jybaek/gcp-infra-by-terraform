provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name = "airflow-project"
  region       = "us-central1"
  zone         = "us-central1-a"
  environment  = "dev"
}

module "gcp_cloud_platform" {
  source       = "./modules/google_cloud_platform"
  project_id   = var.project_id
  account_id   = "compute-engine-account-test"
  display_name = "Test Service Account for Compute Engine"
}

module "gcp_compute_engine" {
  source       = "./modules/google_compute_engine"
  service_name = local.service_name

  region       = local.region
  zone         = local.zone
  machine_type = "e2-standard-4"

  google_service_account_email = module.gcp_cloud_platform.google_service_account_email
  firewall_name                = "test-rule"
  tags                         = ["http-server", "https-server", "test-rule"]
  allow = {
    1 = {
      protocol = "icmp"
      ports    = null
    },
    2 = {
      protocol = "tcp"
      ports    = ["22", "8080"]
    },
  }
}
