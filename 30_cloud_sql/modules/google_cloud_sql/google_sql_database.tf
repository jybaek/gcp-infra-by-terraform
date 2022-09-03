resource "google_sql_database" "database" {
  project  = var.project_id
  name     = "${var.service_name}-database"
  instance = google_sql_database_instance.this.name
}