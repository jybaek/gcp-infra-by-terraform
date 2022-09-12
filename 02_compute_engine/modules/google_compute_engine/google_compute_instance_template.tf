resource "google_compute_instance_template" "this" {
  project     = var.project_id
  name        = "${var.service_name}-template"
  description = "A template made by Terraform."

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
    source_image = "debian-cloud/debian-11"
    auto_delete  = true
    boot         = true
    // backup the disk every day
    resource_policies = [google_compute_resource_policy.this.id]
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
    email  = var.email
    scopes = ["cloud-platform"]
  }
}