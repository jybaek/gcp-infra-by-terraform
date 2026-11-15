resource "google_service_account" "eventarc_sa" {
  account_id   = "${var.service_name}-trigger-sa"
  display_name = "Eventarc Trigger Service Account"
  project      = var.project_id
}

resource "google_project_iam_member" "event_receiver" {
  project = var.project_id
  role    = "roles/eventarc.eventReceiver"
  member  = "serviceAccount:${google_service_account.eventarc_sa.email}"
}

resource "google_project_iam_member" "workflow_invoker" {
  project = var.project_id
  role    = "roles/workflows.invoker"
  member  = "serviceAccount:${google_service_account.eventarc_sa.email}"
}
