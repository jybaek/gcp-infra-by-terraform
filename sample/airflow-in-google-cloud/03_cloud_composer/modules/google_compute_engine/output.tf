output "google_compute_network_id" {
  description = "ID of the created google_compute_network id"
  value       = google_compute_network.this.id
}

output "google_compute_subnetwork_id" {
  description = "ID of the created google_compute_subnetwork id"
  value       = google_compute_subnetwork.this.id
}