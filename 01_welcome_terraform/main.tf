provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name = "terraform"
}

module "gcp_compute_engine" {
  source       = "./modules/google_compute_engine"
  project_id   = var.project_id
  service_name = local.service_name
}