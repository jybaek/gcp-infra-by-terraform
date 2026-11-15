variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name = "genai-rag"
  backend_name = "rag-api-server"
  region       = "us-central1"
  labels = {
    "env"      = "sample"
    "workload" = "genai-rag"
  }
}
