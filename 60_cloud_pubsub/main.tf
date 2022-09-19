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
  labels = {
    created_by = local.service_name
  }
}

module "google_cloud_pubsub" {
  source       = "./modules/google_cloud_pubsub"
  project_id   = var.project_id
  service_name = local.service_name
  labels       = local.labels

  message_retention_duration = "86600s"
  ack_deadline_seconds       = 20
  push_endpoint              = "https://example.com/push"
  attributes = {
    x-goog-version = "v1"
  }
}
