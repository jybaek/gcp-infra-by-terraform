variable "display_name" {
  description = "display_name"
  type        = string
}

variable "num_nodes" {
  description = "num_nodes"
  type        = number
  default     = 1
}

variable "config" {
  description = "region"
  type        = string
}

variable "labels" {
  description = "labels"
  type        = map(string)
}

variable "db_name" {
  description = "db_name"
  type        = string
}

variable "deletion_protection" {
  description = "deletion_protection"
  type        = bool
  default     = false
  validation {
    condition     = contains([true, false], var.deletion_protection)
    error_message = "Invalid value"
  }
}

variable "version_retention_period" {
  description = "version_retention_period"
  type        = string
  default     = "3d"
}

variable "ddl" {
  description = "ddl"
  type = list(string)
}