output "cluster_name" {
  value = google_container_cluster.this.name
}

output "vllm_gsa_email" {
  value = google_service_account.vllm_gsa.email
}
