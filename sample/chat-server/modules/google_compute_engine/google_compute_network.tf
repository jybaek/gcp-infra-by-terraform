resource "google_compute_network" "this" {
  name = "${var.name}-network"
}