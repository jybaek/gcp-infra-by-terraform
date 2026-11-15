resource "google_memorystore_instance" "this" {
  instance_id                 = "${var.service_name}-cluster"
  project                     = var.project_id
  location                    = var.region
  shard_count                 = 1
  replica_count               = 0
  node_type                   = "SHARED_CORE_NANO"
  engine_version              = "VALKEY_8_0"
  mode                        = "CLUSTER"
  authorization_mode          = "AUTH_DISABLED"
  transit_encryption_mode     = "TRANSIT_ENCRYPTION_DISABLED"
  deletion_protection_enabled = false

  desired_auto_created_endpoints {
    network    = var.network_id
    project_id = var.project_id
  }

  zone_distribution_config {
    mode = "MULTI_ZONE"
  }
}
