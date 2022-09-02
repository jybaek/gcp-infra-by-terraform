data "google_compute_image" "this" {
  family  = "debian-11"
  project = "debian-cloud"
}

resource "google_compute_disk" "this" {
  project = var.project_id
  name    = "existing-disk"
  image   = data.google_compute_image.this.self_link
  size    = 10
  type    = "pd-ssd"
  zone    = var.zone
}
