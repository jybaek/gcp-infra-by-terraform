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

module "google_cloud_spanner" {
  source       = "./modules/google_cloud_spanner"
  config       = "regional-us-central1"
  db_name      = "${local.service_name}-database"
  display_name = "main-instance"
  labels = {
    foo = "bar"
  }
  ddl = [
    "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
    "CREATE TABLE t2 (t2 INT64 NOT NULL,) PRIMARY KEY(t2)",
  ]
}
