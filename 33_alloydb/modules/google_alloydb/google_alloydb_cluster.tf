resource "google_alloydb_cluster" "this" {
  provider   = google-beta
  project    = var.project_id
  cluster_id = var.service_name
  location   = var.location
  network    = "projects/${var.project_id}/global/networks/${var.vpc_network_name}"

  automated_backup_policy {
    location      = var.location
    backup_window = "1800s"
    enabled       = true

    weekly_schedule {
      days_of_week = ["MONDAY"]

      start_times {
        hours   = 23
        minutes = 0
        seconds = 0
        nanos   = 0
      }
    }

    quantity_based_retention {
      count = 1
    }

    labels = var.labels
  }

  labels = var.labels
}
