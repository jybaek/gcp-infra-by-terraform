output "google_compute_network_id" {
  description = "ID of the created VPC Network"
  value       = google_compute_network.this.id
}
