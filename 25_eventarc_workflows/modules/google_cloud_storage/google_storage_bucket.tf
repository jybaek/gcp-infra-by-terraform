data "google_storage_project_service_account" "gcs_account" {
  project = var.project_id
}

resource "google_storage_bucket" "this" {
  name                        = "${var.project_id}-${var.service_name}-inbox"
  project                     = var.project_id
  location                    = var.region
  uniform_bucket_level_access = true
  force_destroy               = true
}

resource "google_project_iam_member" "gcs_pubsub_publisher" {
  project = var.project_id
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"
}
