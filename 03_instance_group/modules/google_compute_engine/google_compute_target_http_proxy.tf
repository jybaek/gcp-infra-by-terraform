resource "google_compute_target_http_proxy" "this" {
  project = var.project_id
  name    = "${var.service_name}-proxy"
  url_map = google_compute_url_map.this.id
}