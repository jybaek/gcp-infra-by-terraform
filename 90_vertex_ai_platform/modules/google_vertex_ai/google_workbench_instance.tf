resource "google_workbench_instance" "this" {
  name     = "${var.service_name}-workbench"
  project  = var.project_id
  location = var.zone

  gce_setup {
    machine_type = "e2-standard-4"
  }
}
