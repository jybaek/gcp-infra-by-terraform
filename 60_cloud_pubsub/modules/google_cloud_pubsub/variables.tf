variable "project_id" {
  description = "project_id"
  type        = string
}

variable "service_name" {
  description = "service_name"
  type        = string
}

variable "labels" {
  description = "labels"
  type        = map(string)
}

variable "message_retention_duration" {
  description = "message_retention_duration"
  type        = string
}

variable "push_endpoint" {
  description = "push_endpoint"
  type        = string
}

variable "attributes" {
  description = "attributes"
  type        = map(string)
}

variable "ack_deadline_seconds" {
  description = "ack_deadline_seconds"
  type        = number
}