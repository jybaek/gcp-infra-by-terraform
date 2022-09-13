resource "google_project_iam_member" "this" {
  project = var.project_id
  role    = var.iam_role
  member  = "serviceAccount:${google_service_account.this.email}"
}
