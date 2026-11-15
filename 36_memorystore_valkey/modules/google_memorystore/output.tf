output "instance_id" {
  value = google_memorystore_instance.this.id
}

output "endpoints" {
  value = google_memorystore_instance.this.endpoints
}
