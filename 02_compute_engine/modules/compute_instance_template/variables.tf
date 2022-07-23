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

variable "network" {
  description = "network"
  type        = string
}

variable "machine_type" {
  description = "machine_type"
  type        = string
}

variable "environment" {
  description = "environment"
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
