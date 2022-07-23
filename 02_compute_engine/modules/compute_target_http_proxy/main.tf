resource "google_compute_target_http_proxy" "default" {
  project = var.project_id
  name    = "${var.service_name}-proxy"
  url_map = google_compute_url_map.default.id
}

resource "google_compute_url_map" "default" {
  project         = var.project_id
  name            = "${var.service_name}-lb"
  default_service = google_compute_backend_service.default.id

  host_rule {
    hosts = ["*"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.default.id

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_service.default.id
    }
  }
}

resource "google_compute_backend_service" "default" {
  project     = var.project_id
  name        = "backend-service"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10
  backend {
    group = var.instance_group_id
  }

  health_checks = [google_compute_http_health_check.default.id]
}

resource "google_compute_http_health_check" "default" {
  project            = var.project_id
  name               = "http-health-check"
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
}