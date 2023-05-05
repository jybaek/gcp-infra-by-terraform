variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name  = "toy-chat"
  frontend_name = "chat-frontend-server"
  backend_name  = "chat-backend-server"
  region        = "us-central1"
  zone          = "us-central1-a"
  labels = {
    "env" = "test"
  }
}
