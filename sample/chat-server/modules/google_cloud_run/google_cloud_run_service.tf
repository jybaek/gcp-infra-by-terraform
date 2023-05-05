resource "google_cloud_run_service" "this" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = "${var.region}-docker.pkg.dev/${var.project_id}/${var.repository}/${var.service_name}:latest"
        ports {
          container_port = var.container_port
        }

        dynamic "env" {
          for_each = var.env
          content {
            name  = env.value.name
            value = env.value.value
          }
        }
      }
    }
    metadata {
      annotations = var.annotations
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}