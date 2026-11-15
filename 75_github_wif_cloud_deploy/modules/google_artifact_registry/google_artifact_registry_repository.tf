resource "google_artifact_registry_repository" "this" {
  project       = var.project_id
  location      = var.region
  repository_id = "${var.service_name}-repo"
  description   = "Container repository for Keyless GitHub Actions CI/CD"
  format        = "DOCKER"
}
