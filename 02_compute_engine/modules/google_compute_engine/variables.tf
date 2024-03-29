variable "project_id" {
  description = "project_id"
  type        = string
}

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
  type        = any
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