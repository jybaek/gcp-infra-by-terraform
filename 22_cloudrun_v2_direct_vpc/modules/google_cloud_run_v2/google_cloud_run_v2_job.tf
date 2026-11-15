resource "google_cloud_run_v2_job" "this" {
  name                = "${var.service_name}-job"
  project             = var.project_id
  location            = var.region
  deletion_protection = false

  template {
    task_count = 1

    template {
      max_retries = 1

      vpc_access {
        egress = "PRIVATE_RANGES_ONLY"
        network_interfaces {
          network    = var.network_name
          subnetwork = var.subnetwork_name
        }
      }

      containers {
        image   = "us-docker.pkg.dev/cloudrun/container/job"
        command = ["/bin/sh", "-c", "echo 'Batch job completed via Direct VPC Egress'"]
      }
    }
  }
}
