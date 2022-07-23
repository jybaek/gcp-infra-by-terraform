output "vpc_network_id" {
  description = "ID of the created VPC Network"
  value       = google_compute_network.vpc_network.id
}