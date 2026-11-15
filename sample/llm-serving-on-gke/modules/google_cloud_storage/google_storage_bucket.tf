resource "google_storage_bucket" "models" {
  name                        = "${var.project_id}-${var.service_name}-models"
  project                     = var.project_id
  location                    = var.region
  uniform_bucket_level_access = true
  force_destroy               = true
}
