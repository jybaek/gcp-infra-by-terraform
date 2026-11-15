output "google_compute_network_id" {
  value = google_compute_network.this.id
}

output "google_compute_subnetwork_id" {
  value = google_compute_subnetwork.this.id
}

output "pods_range_name" {
  value = "${var.service_name}-pods"
}

output "services_range_name" {
  value = "${var.service_name}-services"
}
