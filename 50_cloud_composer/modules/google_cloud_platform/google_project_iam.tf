resource "google_project_iam_member" "this" {
  project = "your-project-id"
  role    = "roles/composer.worker"
  member  = "serviceAccount:${google_service_account.this.email}"
}
