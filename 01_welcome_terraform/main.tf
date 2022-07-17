provider "google" {}

variable "project_id" {
  type  = string
  description = "Enter a unique project-id"
}

locals {
  service_name  = "terraform"
}


module "vpc_network" {
  source       = "./modules/vpc_network"
  project_id   = var.project_id
  service_name = local.service_name
}