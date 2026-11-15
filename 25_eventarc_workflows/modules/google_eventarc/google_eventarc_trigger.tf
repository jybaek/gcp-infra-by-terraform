resource "google_eventarc_trigger" "this" {
  name            = "${var.service_name}-gcs-trigger"
  project         = var.project_id
  location        = var.region
  service_account = google_service_account.eventarc_sa.email

  matching_criteria {
    attribute = "type"
    value     = "google.cloud.storage.object.v1.finalized"
  }

  matching_criteria {
    attribute = "bucket"
    value     = var.bucket_name
  }

  destination {
    workflow = var.workflow_id
  }

  depends_on = [
    google_project_iam_member.event_receiver,
    google_project_iam_member.workflow_invoker,
  ]
}
