resource "google_compute_network" "this" {
  name                    = "${var.service_name}-vpc"
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {
  name                     = "${var.service_name}-subnet"
  project                  = var.project_id
  region                   = var.region
  network                  = google_compute_network.this.id
  ip_cidr_range            = "10.28.0.0/20"
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "${var.service_name}-pods"
    ip_cidr_range = "10.40.0.0/16"
  }

  secondary_ip_range {
    range_name    = "${var.service_name}-services"
    ip_cidr_range = "10.50.0.0/20"
  }
}
