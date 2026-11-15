resource "google_alloydb_cluster" "this" {
  cluster_id          = "${var.service_name}-vector-cluster"
  project             = var.project_id
  location            = var.region
  deletion_protection = false
  labels              = var.labels

  network_config {
    network = var.network_id
  }
}

resource "google_alloydb_instance" "primary" {
  cluster       = google_alloydb_cluster.this.name
  instance_id   = "${var.service_name}-primary"
  instance_type = "PRIMARY"

  database_flags = {
    "google_ml_integration.enable_model_support" = "on"
  }

  machine_config {
    cpu_count = 2
  }
}
