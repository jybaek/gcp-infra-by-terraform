variable "redis_name" {
  description = "redis_name"
  type        = string
}

variable "region" {
  description = "region"
  type        = string
}

variable "network_id" {
  description = "network_id"
  type        = string
}

variable "redis_version" {
  description = "redis_version"
  type        = string
}

variable "display_name" {
  description = "display_name"
  type        = string
}

variable "reserved_ip_range" {
  description = "reserved_ip_range"
  type        = string
}

variable "labels" {
  description = "labels"
  type        = map(string)
}

variable "tier" {
  description = "tier"
  type        = string

  validation {
    condition     = contains(["BASIC", "STANDARD_HA"], var.tier)
    error_message = "Invalid value"
  }
}