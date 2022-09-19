resource "google_pubsub_topic" "this" {
  name                       = "${var.service_name}-topic"
  labels                     = var.labels
  message_retention_duration = var.message_retention_duration
}