resource "google_bigquery_dataset" "this" {
  dataset_id                 = replace("${var.service_name}_dataset", "-", "_")
  project                    = var.project_id
  location                   = var.region
  delete_contents_on_destroy = true
}
