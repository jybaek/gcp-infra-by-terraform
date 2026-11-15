resource "google_service_account" "vm_sa" {
  account_id   = "${var.service_name}-vm-sa"
  display_name = "Zero-Trust Private VM Service Account"
  project      = var.project_id
}

resource "google_compute_instance" "private_vm" {
  name         = "${var.service_name}-private-vm"
  project      = var.project_id
  zone         = var.zone
  machine_type = "e2-micro"
  tags         = ["iap-ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  # No access_config block -> no external/public IP assigned
  network_interface {
    subnetwork = google_compute_subnetwork.this.id
  }

  shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  service_account {
    email  = google_service_account.vm_sa.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}
