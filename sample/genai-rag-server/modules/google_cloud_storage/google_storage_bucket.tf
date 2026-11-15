resource "google_storage_bucket" "docs" {
  name                        = "${var.project_id}-${var.service_name}-docs"
  project                     = var.project_id
  location                    = var.region
  uniform_bucket_level_access = true
  force_destroy               = true
}
