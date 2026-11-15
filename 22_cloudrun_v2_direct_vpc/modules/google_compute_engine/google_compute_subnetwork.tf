resource "google_compute_subnetwork" "this" {
  name                     = "${var.service_name}-subnet"
  project                  = var.project_id
  region                   = var.region
  network                  = google_compute_network.this.id
  ip_cidr_range            = "10.12.0.0/24"
  private_ip_google_access = true
}
