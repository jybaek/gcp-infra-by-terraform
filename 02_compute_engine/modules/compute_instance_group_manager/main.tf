resource "google_compute_health_check" "default" {
  project             = var.project_id
  name                = "autohealing-health-check"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 10 # 50 seconds

  http_health_check {
    request_path = "/healthz"
    port         = "8080"
  }
}

resource "google_compute_instance_group_manager" "default" {
  project            = var.project_id
  name               = "${var.service_name}-vm"

  base_instance_name = "app"
  zone               = var.zone

  version {
    instance_template  = var.instance_template_id
  }

  target_size  = 2

  named_port {
    name = "customhttp"
    port = 8888
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.default.id
    initial_delay_sec = 300
  }
}