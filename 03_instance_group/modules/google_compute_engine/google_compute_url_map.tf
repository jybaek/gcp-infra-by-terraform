resource "google_compute_url_map" "this" {
  project         = var.project_id
  name            = "${var.service_name}-lb"
  default_service = google_compute_backend_service.this.id

  host_rule {
    hosts        = ["*"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.this.id

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_service.this.id
    }
  }
}