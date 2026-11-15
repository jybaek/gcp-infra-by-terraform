resource "google_secret_manager_secret" "app_secret" {
  secret_id = "${var.service_name}-app-config"
  project   = var.project_id

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "v1" {
  secret      = google_secret_manager_secret.app_secret.id
  secret_data = "sample-api-token-replace-in-prod"
}

resource "google_secret_manager_secret_iam_member" "vm_accessor" {
  project   = var.project_id
  secret_id = google_secret_manager_secret.app_secret.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${var.vm_service_account}"
}
