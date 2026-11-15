resource "google_bigquery_connection" "biglake" {
  connection_id = "${var.service_name}-conn"
  project       = var.project_id
  location      = var.region
  friendly_name = "BigLake GCS Connection"

  cloud_resource {}
}

resource "google_storage_bucket_iam_member" "biglake_storage_admin" {
  bucket = var.bucket_name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_bigquery_connection.biglake.cloud_resource[0].service_account_id}"
}
