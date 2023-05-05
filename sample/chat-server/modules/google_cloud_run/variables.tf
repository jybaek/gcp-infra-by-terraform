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

variable "container_port" {
  description = "container_port"
  default     = 8000
  type        = number
}

variable "repository" {
  description = "artifact_registry"
  type        = string
}

variable "annotations" {
  description = "vpc_access_connector"
  type        = map(any)
  default     = {}
}

variable "env" {
  description = "env"
  type        = list(any)
  default     = []
}