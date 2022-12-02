output "vpc_network_id" {
  description = "ID of the created VPC Network"
  value       = google_compute_network.this.id
}

output "vpc_network_name" {
  description = "Name of the created VPC Network"
  value       = google_compute_network.this.name
}

output "google_compute_global_address_name" {
  description = "Name of the google_compute_global_address"
  value       = google_compute_global_address.private_ip_alloc.name
}
