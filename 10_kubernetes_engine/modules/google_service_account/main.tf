resource "google_service_account" "default" {
  project      = var.project_id
  account_id   = "service-account-id"
  display_name = "Service Account"
}
