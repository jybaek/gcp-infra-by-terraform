# frontend artifact registry
module "frontend_artifact_registry" {
  source        = "./modules/google_artifact_registry"
  region        = local.region
  repository_id = "${local.frontend_name}-repo"
}

# frontend cloud run
module "frontend_cloud_run" {
  source         = "./modules/google_cloud_run"
  project_id     = var.project_id
  service_name   = local.frontend_name
  region         = local.region
  repository     = module.frontend_artifact_registry.google_artifact_registry_repository
  container_port = 80
}
