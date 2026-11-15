resource "google_compute_network" "this" {
  name                    = "${var.service_name}-vpc"
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {
  name                     = "${var.service_name}-private-subnet"
  project                  = var.project_id
  region                   = var.region
  network                  = google_compute_network.this.id
  ip_cidr_range            = "10.18.0.0/24"
  private_ip_google_access = true
}
