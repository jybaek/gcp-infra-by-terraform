provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

variable "github_repository" {
  type        = string
  description = "GitHub owner/repo allowed to authenticate via OIDC"
  default     = "jybaek/gcp-infra-by-terraform"
}

locals {
  service_name = "keyless-cicd"
  region       = "us-central1"
  github_owner = split("/", var.github_repository)[0]
}

module "google_artifact_registry" {
  source       = "./modules/google_artifact_registry"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
}

module "google_iam_workload_identity" {
  source            = "./modules/google_iam_workload_identity"
  project_id        = var.project_id
  service_name      = local.service_name
  github_owner      = local.github_owner
  github_repository = var.github_repository
}

module "google_clouddeploy" {
  source       = "./modules/google_clouddeploy"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region
}
