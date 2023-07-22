data "google_project" "project" {}

resource "google_project_iam_member" "this" {
  project = var.project_id
  role    = var.iam_role
  member  = "serviceAccount:${google_service_account.this.email}"
}

resource "google_service_account_iam_member" "custom_service_account" {
  service_account_id = google_service_account.this.name
  role               = "roles/composer.ServiceAgentV2Ext"
  member             = "serviceAccount:service-${data.google_project.project.number}@cloudcomposer-accounts.iam.gserviceaccount.com"
}