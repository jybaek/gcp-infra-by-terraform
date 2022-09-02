output "vpc_network_id" {
  description = "ID of the created VPC Network"
  value       = google_compute_network.this.id
}

output "google_compute_instance_group_manager_id" {
  description = "ID of the created instance group id"
  value       = google_compute_instance_group_manager.this.instance_group
}

output "google_compute_instance_template_id" {
  description = "ID of the created instance template"
  value       = google_compute_instance_template.this.id
}

output "google_google_compute_target_http_proxy_id" {
  description = "ID of the created target http proxy"
  value       = google_compute_target_http_proxy.this.id
}