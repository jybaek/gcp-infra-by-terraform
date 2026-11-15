resource "google_workflows_workflow" "this" {
  name                = "${var.service_name}-pipeline"
  project             = var.project_id
  region              = var.region
  description         = "Processes Cloud Storage object finalized events from Eventarc"
  service_account     = google_service_account.workflow_sa.id
  deletion_protection = false

  source_contents = <<-EOF
  main:
    params: [event]
    steps:
      - log_event:
          call: sys.log
          args:
            text: $${"Received GCS object: " + event.data.bucket + "/" + event.data.name}
            severity: INFO
      - finish:
          return:
            status: "PROCESSED"
            bucket: $${event.data.bucket}
            object: $${event.data.name}
  EOF
}
