provider "google" {}

variable "project_id" {
  type        = string
  description = "Enter a unique project-id"
}

variable "bucket_name" {
  type = string
  description = "Enter a unique bucket-name"
}

variable "page" {
  type= string
  description = ""
}


locals {
  service_name = "terraform"
  region       = "us-central1"
  zone         = "us-central1-a"
}

module "google_cloud_storage"{
    source = "./modules/google_cloud_stroage"
    bucket_name = var.bucket_name
    project = var.project_id
    # website = {
    #     data = {
    #         main_page_suffix = "index.html", 
    #         not_found_page = "index.html",
    #     }
    # }
}
