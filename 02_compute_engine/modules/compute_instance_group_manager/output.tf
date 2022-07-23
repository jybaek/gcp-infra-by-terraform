output "google_compute_instance_group_manager_id" {
  description = "ID of the created instance group id"
  value       = google_compute_instance_group_manager.default.instance_group
}