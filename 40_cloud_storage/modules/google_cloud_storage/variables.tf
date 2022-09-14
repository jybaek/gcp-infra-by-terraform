variable "bucket_name" {
  description = "bucket name"
}

variable "storage_class" {
  description = "storage class name"
  default     = "STANDARD"
}

variable "location" {
  description = "location"
  default     = "ASIA-NORTHEAST3"
}

variable "project_id" {
  description = "project id"
}

variable "origin" {
  description = "cors origin"
  default     = ["*"]
}

variable "method" {
  description = "method list"
  type        = list(any)
  default     = ["GET", "HEAD", "PUT", "POST", "DELETE"]
}

variable "response_header" {
  description = "response_header list"
  default     = ["*"]
}

variable "website" {
  type = map(object({
    main_page_suffix = string
    not_found_page   = string
  }))
  default = {}
}

