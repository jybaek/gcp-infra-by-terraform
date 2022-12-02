resource "google_service_networking_connection" "vpc_connection" {
  network                 = var.network
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [var.reserved_peering_ranges]
}