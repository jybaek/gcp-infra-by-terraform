resource "google_alloydb_instance" "default" {
  provider      = google-beta
  cluster       = google_alloydb_cluster.this.name
  instance_id   = "alloydb-instance"
  instance_type = var.instance_type
  machine_config {
    cpu_count = var.cpu_count
  }
}
