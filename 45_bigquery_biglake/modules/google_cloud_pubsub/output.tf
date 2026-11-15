output "topic_name" {
  value = google_pubsub_topic.this.name
}

output "subscription_name" {
  value = google_pubsub_subscription.bigquery_direct.name
}
