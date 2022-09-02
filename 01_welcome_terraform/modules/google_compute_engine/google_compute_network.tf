resource "google_compute_network" "this" {
  project = var.project_id
  name    = "${var.service_name}-network"
}