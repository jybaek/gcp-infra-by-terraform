resource "google_compute_firewall" "this" {
  name    = var.firewall_name
  network = google_compute_network.this.name

  dynamic "allow" {
    for_each = var.allow
    content {
      protocol = lookup(allow.value, "protocol", null)
      ports    = lookup(allow.value, "ports", null)
    }
  }

  source_ranges = [var.source_ranges]
}