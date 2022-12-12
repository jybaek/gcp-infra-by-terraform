resource "google_spanner_instance" "main" {
  config       = var.config
  display_name = var.display_name
  num_nodes    = var.num_nodes
  labels       = var.labels
}