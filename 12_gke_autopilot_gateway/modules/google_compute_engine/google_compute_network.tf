resource "google_compute_network" "this" {
  name                    = "${var.service_name}-vpc"
  project                 = var.project_id
  auto_create_subnetworks = false
}
