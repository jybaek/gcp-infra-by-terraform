# backend artifact registry
module "backend_artifact_registry" {
  source        = "./modules/google_artifact_registry"
  region        = local.region
  repository_id = "${local.backend_name}-repo"
}

# backend cloud run
module "backend_cloud_run" {
  source       = "./modules/google_cloud_run"
  project_id   = var.project_id
  service_name = local.backend_name
  region       = local.region
  repository   = module.backend_artifact_registry.google_artifact_registry_repository
  annotations = {
    "run.googleapis.com/vpc-access-connector" = module.google_serverless_vpc_access.google_vpc_access_connector
    "run.googleapis.com/vpc-access-egress"    = "all-traffic"
  }
  container_port = 8000
  env = [
    {
      name  = "REDIS_HOST"
      value = "redis://${module.google_redis_instance.google_redis_instance_host}"
    },
  ]
}