resource "google_sql_database_instance" "this" {
  project          = var.project_id
  name             = "${var.service_name}-database-instance"
  region           = var.region
  database_version = var.database_version
  settings {
    tier = var.db_tier
  }

  deletion_protection = "true"
}