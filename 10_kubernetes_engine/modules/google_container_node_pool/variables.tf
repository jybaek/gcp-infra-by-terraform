variable "project_id" {
  description = "project_id"
  type        = string
}

variable "service_name" {
  description = "service_name"
  type        = string
}

variable "machine_type" {
  description = "machine_type"
  type        = string
}

variable "google_service_account_email" {
  description = "The Email of the Account"
  type        = string
}

variable "google_container_cluster_id" {
  description = "The ID of the cluster"
  type        = string
}