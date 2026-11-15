resource "google_service_account" "this" {
  account_id   = "${var.service_name}-workload-sa"
  display_name = "Workload Identity Service Account for ${var.service_name}"
  project      = var.project_id
}
