resource "google_bigquery_table" "biglake_iceberg" {
  dataset_id          = google_bigquery_dataset.this.dataset_id
  table_id            = "biglake_iceberg_events"
  project             = var.project_id
  deletion_protection = false

  schema = jsonencode([
    {
      name = "event_id"
      type = "STRING"
      mode = "REQUIRED"
    },
    {
      name = "event_timestamp"
      type = "TIMESTAMP"
      mode = "NULLABLE"
    },
    {
      name = "payload"
      type = "STRING"
      mode = "NULLABLE"
    }
  ])

  biglake_configuration {
    connection_id = google_bigquery_connection.biglake.name
    storage_uri   = "${var.bucket_url}/iceberg/events"
    file_format   = "PARQUET"
    table_format  = "ICEBERG"
  }

  depends_on = [google_storage_bucket_iam_member.biglake_storage_admin]
}

resource "google_bigquery_table" "streaming_events" {
  dataset_id          = google_bigquery_dataset.this.dataset_id
  table_id            = "pubsub_streaming_events"
  project             = var.project_id
  deletion_protection = false

  schema = jsonencode([
    {
      name = "subscription_name"
      type = "STRING"
      mode = "NULLABLE"
    },
    {
      name = "message_id"
      type = "STRING"
      mode = "NULLABLE"
    },
    {
      name = "publish_time"
      type = "TIMESTAMP"
      mode = "NULLABLE"
    },
    {
      name = "data"
      type = "STRING"
      mode = "NULLABLE"
    },
    {
      name = "attributes"
      type = "STRING"
      mode = "NULLABLE"
    }
  ])
}
