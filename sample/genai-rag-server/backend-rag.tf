# -----------------------------------------------------------------------------
# Artifact Registry & Cloud Run v2 RAG Backend (Direct VPC Egress + Vertex AI)
# -----------------------------------------------------------------------------
module "backend_artifact_registry" {
  source        = "./modules/google_artifact_registry"
  project_id    = var.project_id
  region        = local.region
  repository_id = "${local.backend_name}-repo"
}

module "backend_cloud_run_v2" {
  source          = "./modules/google_cloud_run_v2"
  project_id      = var.project_id
  service_name    = local.backend_name
  region          = local.region
  network_name    = module.google_compute_engine.vpc_network_name
  subnetwork_name = module.google_compute_engine.subnetwork_name
  docs_bucket     = module.google_cloud_storage.bucket_name
  alloydb_ip      = module.google_alloydb.primary_ip_address
}
