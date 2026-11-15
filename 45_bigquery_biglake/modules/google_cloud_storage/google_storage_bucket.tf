resource "google_storage_bucket" "this" {
  name                        = "${var.project_id}-${var.service_name}-lakehouse"
  project                     = var.project_id
  location                    = var.region
  uniform_bucket_level_access = true
  force_destroy               = true
}
