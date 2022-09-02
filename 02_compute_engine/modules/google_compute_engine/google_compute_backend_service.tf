resource "google_compute_backend_service" "this" {
  project     = var.project_id
  name        = "backend-service"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10
  backend {
    group = var.instance_group_id
  }

  health_checks = [google_compute_http_health_check.this.id]
}
