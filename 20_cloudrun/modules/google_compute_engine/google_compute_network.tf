resource "google_compute_network" "vpc_network" {
  project = var.project_id
  name    = "${var.service_name}-network"
}