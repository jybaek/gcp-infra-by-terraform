resource "google_clouddeploy_delivery_pipeline" "this" {
  name     = "${var.service_name}-pipeline"
  project  = var.project_id
  location = var.region

  serial_pipeline {
    stages {
      target_id = google_clouddeploy_target.staging.name
      profiles  = ["staging"]
    }

    stages {
      target_id = google_clouddeploy_target.prod.name
      profiles  = ["prod"]

      strategy {
        canary {
          runtime_config {
            cloud_run {
              automatic_traffic_control = true
            }
          }
          canary_deployment {
            percentages = [25, 50]
            verify      = false
          }
        }
      }
    }
  }
}
