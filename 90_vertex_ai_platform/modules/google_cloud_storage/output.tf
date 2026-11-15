output "embeddings_uri" {
  value      = "gs://${google_storage_bucket.this.name}/contents"
  depends_on = [google_storage_bucket_object.index_dir]
}
