resource "google_network_connectivity_service_connection_policy" "this" {
  name          = "${var.service_name}-psc-policy"
  project       = var.project_id
  location      = var.region
  service_class = "gcp-memorystore"
  network       = var.network_id

  psc_config {
    subnetworks = [var.subnetwork_id]
  }
}
