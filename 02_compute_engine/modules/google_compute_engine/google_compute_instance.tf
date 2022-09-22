resource "google_compute_instance" "default" {
  project      = var.project_id
  name         = var.service_name
  machine_type = var.machine_type
  zone         = var.zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      type  = var.boot_disk_type
      size  = 80
    }
  }

  network_interface {
    network = google_compute_network.this.id

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = var.metadata

  metadata_startup_script = var.metadata_startup_script

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.google_service_account_email
    scopes = ["cloud-platform"]
  }
}