resource "google_storage_bucket" "this" {
  name                        = "${var.project_id}-${var.service_name}-embeddings"
  project                     = var.project_id
  location                    = var.region
  uniform_bucket_level_access = true
  force_destroy               = true
}

resource "google_storage_bucket_object" "index_dir" {
  name    = "contents/"
  content = " "
  bucket  = google_storage_bucket.this.name
}
