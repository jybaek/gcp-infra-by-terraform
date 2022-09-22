provider "google" {
  project = var.project_id
}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

locals {
  service_name = "terraform"
  region       = "us-central1"
  zone         = "us-central1-a"
  bucket_name  = "${local.service_name}-bucket"
}

module "google_cloud_storage" {
  source        = "./modules/google_cloud_storage"
  project_id    = var.project_id
  location      = local.region
  bucket_name   = local.bucket_name
  method        = ["GET", "HEAD", "PUT", "POST", "DELETE"]
  storage_class = "STANDARD"
  # website = {
  #     data = {
  #         main_page_suffix = "index.html", 
  #         not_found_page = "index.html",
  #     }
  # }
}
