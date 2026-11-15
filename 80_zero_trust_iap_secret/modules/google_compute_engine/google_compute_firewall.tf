resource "google_compute_firewall" "allow_iap_ssh" {
  name    = "${var.service_name}-allow-iap-ssh"
  project = var.project_id
  network = google_compute_network.this.name

  direction     = "INGRESS"
  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["iap-ssh"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
