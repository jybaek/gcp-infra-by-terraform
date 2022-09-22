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
}

module "google_cloud_sql" {
  source           = "./modules/google_cloud_sql"
  project_id       = var.project_id
  service_name     = local.service_name
  region           = local.region
  database_version = "MYSQL_8_0"
  db_tier          = "db-f1-micro"
}
