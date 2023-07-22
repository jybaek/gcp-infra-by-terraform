resource "google_compute_network" "this" {
  project                 = var.project_id
  name                    = "${var.service_name}-network"
  auto_create_subnetworks = var.auto_create_subnetworks
}