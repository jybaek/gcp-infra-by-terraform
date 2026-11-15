output "dataset_id" {
  value = google_bigquery_dataset.this.dataset_id
}

output "streaming_table_id" {
  value = google_bigquery_table.streaming_events.table_id
}

output "biglake_table_id" {
  value = google_bigquery_table.biglake_iceberg.table_id
}
