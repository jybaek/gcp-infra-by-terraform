resource "google_container_cluster" "this" {
  project          = var.project_id
  name             = "${var.service_name}-gke-cluster"
  location         = var.region
  enable_autopilot = true
  network          = var.google_compute_network_id
  ip_allocation_policy {}
}
