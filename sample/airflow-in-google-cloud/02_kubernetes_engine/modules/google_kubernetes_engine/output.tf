output "cluster_id" {
  description = "ID of the created cluster id"
  value       = google_container_cluster.this.id
}

output "endpoint" {
  description = "endpoint of the created cluster"
  value       = google_container_cluster.this.endpoint
}

output "cluster_ca_certificate" {
  value = google_container_cluster.this.master_auth[0].cluster_ca_certificate
}