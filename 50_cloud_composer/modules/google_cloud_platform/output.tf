output "google_service_account_name" {
  description = "Name of the created service account"
  value       = google_service_account.this.name
}
