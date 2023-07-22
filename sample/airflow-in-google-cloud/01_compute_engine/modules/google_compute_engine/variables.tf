variable "service_name" {
  description = "service_name"
  type        = string
}

variable "region" {
  description = "region"
  type        = string
}

variable "zone" {
  description = "zone"
  type        = string
}

variable "machine_type" {
  description = "machine_type"
  type        = string
}

variable "metadata" {
  description = "metadata"
  type        = map(any)
  default     = {}
}

variable "tags" {
  description = "tags"
  type        = any
}

variable "google_service_account_email" {
  description = "google_service_account_email"
  type        = string
}

variable "metadata_startup_script" {
  description = "metadata_startup_script"
  type        = string
  default     = null
}

variable "boot_disk_type" {
  description = "boot_disk_type"
  type        = string
  default     = "pd-standard"
  validation {
    condition     = contains(["pd-standard", "pd-balanced", "pd-ssd"], var.boot_disk_type)
    error_message = "Such as pd-standard, pd-balanced or pd-ssd"
  }
}

variable "firewall_name" {
  type = string
}

variable "allow" {
  description = "allow"
  type = map(object({
    protocol = string
    ports    = list(string)
  }))
}

variable "source_ranges" {
  description = "e.g., 0.0.0.0/0"
  type        = string
  default     = "0.0.0.0/0"
}