variable "project_id" {
  description = "project_id"
  type        = string
}

variable "service_name" {
  description = "service_name"
  type        = string
}

variable "location" {
  description = "location"
  type        = string
}

variable "instance_type" {
  description = "region"
  type        = string
  default     = "PRIMARY"
  validation {
    condition     = contains(["PRIMARY", "READ_POOL"], var.instance_type)
    error_message = "Such as PRIMARY, READ_POOL"
  }
}

variable "cpu_count" {
  description = "cpu_count"
  type        = number
  default     = 4
}

variable "vpc_network_name" {
  description = "vpc_network_name"
  type        = string
}

variable "labels" {
  description = "labels"
  type        = map(string)
}