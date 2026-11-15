data "google_project" "current" {
  project_id = var.project_id
}

resource "google_project_iam_member" "pubsub_bq_writer" {
  project = var.project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:service-${data.google_project.current.number}@gcp-sa-pubsub.iam.gserviceaccount.com"
}

resource "google_pubsub_subscription" "bigquery_direct" {
  name    = "${var.service_name}-bq-sub"
  project = var.project_id
  topic   = google_pubsub_topic.this.id

  bigquery_config {
    table          = "${var.project_id}:${var.dataset_id}.${var.streaming_table_id}"
    write_metadata = true
  }

  depends_on = [google_project_iam_member.pubsub_bq_writer]
}
