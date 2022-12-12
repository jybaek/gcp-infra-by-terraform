resource "google_spanner_database" "database" {
  instance                 = google_spanner_instance.main.name
  name                     = var.db_name
  version_retention_period = var.version_retention_period
  ddl                      = var.ddl
  deletion_protection      = var.deletion_protection
}