resource "google_pubsub_subscription" "push" {
  name                 = "${var.service_name}-subscription-push"
  topic                = google_pubsub_topic.this.name
  ack_deadline_seconds = 20
  labels               = var.labels

  push_config {
    push_endpoint = var.push_endpoint
    attributes    = var.attributes
  }
}

resource "google_pubsub_subscription" "pull" {
  name   = "${var.service_name}-subscription-pull"
  topic  = google_pubsub_topic.this.name
  labels = var.labels

  message_retention_duration = var.message_retention_duration
  retain_acked_messages      = true
  ack_deadline_seconds       = var.ack_deadline_seconds

  expiration_policy {
    ttl = "300000.5s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }

  enable_message_ordering = false
}