resource "google_container_cluster" "this" {
  name                = "${var.service_name}-cluster"
  project             = var.project_id
  location            = var.region
  enable_autopilot    = true
  deletion_protection = false

  network    = var.network_id
  subnetwork = var.subnetwork_id

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_range_name
    services_secondary_range_name = var.service_range_name
  }

  release_channel {
    channel = "REGULAR"
  }
}
