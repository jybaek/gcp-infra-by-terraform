resource "google_redis_instance" "cache" {
  name           = var.redis_name
  region         = var.region
  tier           = var.tier
  memory_size_gb = 1

  redis_version     = var.redis_version
  display_name      = var.display_name
  reserved_ip_range = var.reserved_ip_range

  labels = var.labels

  maintenance_policy {
    weekly_maintenance_window {
      day = "TUESDAY"
      start_time {
        hours   = 0
        minutes = 30
        seconds = 0
        nanos   = 0
      }
    }
  }
}