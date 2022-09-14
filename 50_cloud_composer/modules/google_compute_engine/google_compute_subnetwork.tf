resource "google_compute_subnetwork" "this" {
  name          = "${var.service_name}-subnetwork"
  project       = var.project_id
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = google_compute_network.this.id
}