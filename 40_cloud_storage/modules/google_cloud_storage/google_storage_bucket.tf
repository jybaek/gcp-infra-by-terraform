resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.location
  force_destroy = true
  project       = var.project_id

  storage_class = var.storage_class

  dynamic "website" {
    for_each = var.website
    iterator = web_info
    content {
      main_page_suffix = web_info.value["main_page_suffix"]
      not_found_page   = web_info.value["not_found_page"]
    }
  }

  cors {
    origin          = var.origin
    method          = var.method
    response_header = var.response_header
    max_age_seconds = 3600
  }
}