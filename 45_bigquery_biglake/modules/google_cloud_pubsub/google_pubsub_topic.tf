resource "google_pubsub_topic" "this" {
  name    = "${var.service_name}-stream-topic"
  project = var.project_id
}
