resource "google_compute_network" "this" {
  name = "${var.service_name}-network"
}