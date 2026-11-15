resource "google_service_account" "workflow_sa" {
  account_id   = "${var.service_name}-wf-sa"
  display_name = "Cloud Workflows Execution SA"
  project      = var.project_id
}

resource "google_project_iam_member" "workflow_logger" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.workflow_sa.email}"
}
