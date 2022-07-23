provider "google" {}

variable "project_id" {
  type  = string
  description = "Enter a unique project-id"
}

locals {
  service_name  = "terraform"
  region        = "us-central1"
  zone          = "us-central1-a"
  environment   = "dev"
  tags          = ["alice", "bob"]
}


module "vpc_network" {
  source       = "./modules/vpc_network"
  project_id   = var.project_id
  service_name = local.service_name
}

module "compute_instance_template" {
  source       = "./modules/compute_instance_template"
  project_id   = var.project_id

  region       = local.region
  zone         = local.zone
  network      = module.vpc_network.vpc_network_id
  machine_type = "e2-micro" # 2 vCPU, 1 GB memory

  service_name = local.service_name
  environment  = local.environment
  tags         = local.tags
  metadata     = {
    foo = "bar"
  }
}

module "instance_groups" {
  source       = "./modules/compute_instance_group_manager"
  project_id   = var.project_id
  service_name = local.service_name
  zone         = local.zone

  network              = module.vpc_network.vpc_network_id
  instance_template_id = module.compute_instance_template.google_compute_instance_template_id
}

module "compute_target_http_proxy" {
  source = "./modules/compute_target_http_proxy"
  project_id   = var.project_id
  service_name = local.service_name
  region       = local.region

  instance_group_id = module.instance_groups.google_compute_instance_group_manager_id
}
