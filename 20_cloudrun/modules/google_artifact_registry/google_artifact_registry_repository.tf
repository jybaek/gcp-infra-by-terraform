resource "google_artifact_registry_repository" "default" {
  project       = var.project_id
  location      = var.region
  repository_id = "${var.service_name}-repository"
  description   = "${var.service_name} repository"
  format        = "DOCKER"
}