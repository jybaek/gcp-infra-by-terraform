output "service_uri" {
  value = google_cloud_run_v2_service.this.uri
}

output "job_name" {
  value = google_cloud_run_v2_job.this.name
}
