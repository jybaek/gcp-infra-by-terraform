output "bucket_name" {
  value      = google_storage_bucket.this.name
  depends_on = [google_project_iam_member.gcs_pubsub_publisher]
}
