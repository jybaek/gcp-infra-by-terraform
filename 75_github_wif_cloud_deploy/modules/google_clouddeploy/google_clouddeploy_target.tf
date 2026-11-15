resource "google_clouddeploy_target" "staging" {
  name     = "${var.service_name}-staging"
  project  = var.project_id
  location = var.region

  run {
    location = "projects/${var.project_id}/locations/${var.region}"
  }
}

resource "google_clouddeploy_target" "prod" {
  name             = "${var.service_name}-prod"
  project          = var.project_id
  location         = var.region
  require_approval = true

  run {
    location = "projects/${var.project_id}/locations/${var.region}"
  }
}
