resource "google_compute_instance_group_manager" "this" {
  project = var.project_id
  name    = "${var.service_name}-vm"

  base_instance_name = "app"
  zone               = var.zone

  version {
    instance_template = var.instance_template_id
  }

  target_size = 2

  named_port {
    name = "customhttp"
    port = 8888
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.this.id
    initial_delay_sec = 300
  }
}