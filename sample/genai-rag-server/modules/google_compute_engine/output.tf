output "vpc_network_id" {
  value = google_compute_network.this.id
}

output "vpc_network_name" {
  value = google_compute_network.this.name
}

output "subnetwork_name" {
  value = google_compute_subnetwork.this.name
}

output "private_ip_alloc_name" {
  value = google_compute_global_address.private_ip_alloc.name
}
