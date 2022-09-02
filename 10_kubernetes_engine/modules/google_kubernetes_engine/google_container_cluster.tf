resource "google_container_cluster" "this" {
  project  = var.project_id
  name     = "${var.service_name}-gke-cluster"
  location = var.region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network = var.google_compute_network_id
}
