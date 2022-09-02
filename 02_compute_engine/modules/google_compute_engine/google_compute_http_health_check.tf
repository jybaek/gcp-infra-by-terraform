resource "google_compute_http_health_check" "this" {
  project            = var.project_id
  name               = "http-health-check"
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
}