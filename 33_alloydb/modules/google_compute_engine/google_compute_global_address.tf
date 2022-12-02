resource "google_compute_global_address" "private_ip_alloc" {
  name          = var.service_name
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  prefix_length = 16
  network       = google_compute_network.this.id
}