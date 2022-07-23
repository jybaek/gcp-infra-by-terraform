resource "google_service_account" "default" {
  # xxx. Enable the IAM API.
  # link: https://console.cloud.google.com/marketplace/product/google/iam.googleapis.com?q=search&referrer=search&authuser=2&project=xxxxxxx
  project      = var.project_id
  account_id   = "service-account-id"
  display_name = "Service Account"
}

resource "google_compute_instance_template" "default" {
  project      = var.project_id
  name         = "${var.service_name}-template"
  description  = "A template made by Terraform."

  tags = var.tags

  labels = {
    environment = var.environment
  }

  instance_description = "description assigned to instances"
  machine_type         = var.machine_type
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  // Create a new boot disk from an image
  disk {
    source_image      = "debian-cloud/debian-11"
    auto_delete       = true
    boot              = true
    // backup the disk every day
    resource_policies = [google_compute_resource_policy.default.id]
  }

  // Use an existing disk resource
#  disk {
#    // Instance Templates reference disks by name, not self link
#    source      = google_compute_disk.default.name
#    auto_delete = false
#    boot        = false
#  }

  network_interface {
    network = var.network
  }

  metadata = var.metadata

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}

data "google_compute_image" "default" {
  family  = "debian-11"
  project = "debian-cloud"
}

resource "google_compute_disk" "default" {
  project = var.project_id
  name    = "existing-disk"
  image   = data.google_compute_image.default.self_link
  size    = 10
  type    = "pd-ssd"
  zone    = var.zone
}

resource "google_compute_resource_policy" "default" {
  project = var.project_id
  name    = "every-day-4am"
  region  = var.region
  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time    = "04:00"
      }
    }
  }
}