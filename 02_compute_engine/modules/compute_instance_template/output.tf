output "google_compute_instance_template_id" {
  description = "ID of the created instance template"
  value       = google_compute_instance_template.default.id
}