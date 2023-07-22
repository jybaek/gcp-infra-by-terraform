variable "project_id" {
  description = "project_id"
  type        = string
}

variable "service_name" {
  description = "service_name"
  type        = string
}

variable "auto_create_subnetworks" {
  description = "auto_create_subnetworks"
  type        = bool
}

variable "ip_cidr_range" {
  description = "ip_cidr_range"
  type        = string
}

variable "region" {
  description = "region"
  type        = string
}