resource "google_container_node_pool" "primary_preemptible_nodes" {
  project    = var.project_id
  name       = "${var.service_name}-node-pool"
  cluster    = var.google_container_cluster_id
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = var.machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = var.google_service_account_email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}