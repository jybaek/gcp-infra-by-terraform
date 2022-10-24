provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name = "terraform-test"
  region       = "us-central1"
  zone         = "us-central1-a"
}

module "google_compute_engine" {
  source       = "./modules/google_compute_engine"
  service_name = local.service_name
}

module "google_redis_instance" {
  source            = "./modules/google_cloud_redis"
  network_id        = module.google_compute_engine.google_compute_network_id
  region            = local.region
  service_name      = local.service_name
  tier              = "STANDARD_HA"
  redis_version     = "REDIS_4_0"
  display_name      = "Terraform Test Instance"
  reserved_ip_range = "192.168.0.0/29"

  labels = {
    foo = "bar"
  }
}