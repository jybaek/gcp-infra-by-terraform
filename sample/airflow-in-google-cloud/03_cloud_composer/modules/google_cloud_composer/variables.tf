variable "region" {
  description = "region"
  type        = string
}

variable "project_id" {
  description = "project id"
}

variable "service_name" {
  description = "service_name"
  type        = string
}

variable "environment_size" {
  description = "environment_size"
  type        = string

  validation {
    condition     = contains(["ENVIRONMENT_SIZE_SMALL",
      "ENVIRONMENT_SIZE_MEDIUM", "ENVIRONMENT_SIZE_LARGE"], var.environment_size)
    error_message = "Invalid value"
  }
}

variable "google_compute_network_id" {
  description = "google_compute_network_id"
  type        = string
}

variable "google_compute_subnetwork_id" {
  description = "google_compute_subnetwork_id"
  type        = string
}

variable "google_service_account_name" {
  description = "google_service_account_name"
  type        = string
}
