resource "google_service_account" "vllm_gsa" {
  account_id   = "${var.service_name}-vllm-gsa"
  display_name = "vLLM GCS Model Loader Service Account"
  project      = var.project_id
}

resource "google_storage_bucket_iam_member" "model_reader" {
  bucket = var.model_bucket_name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.vllm_gsa.email}"
}

resource "google_service_account_iam_member" "workload_identity" {
  service_account_id = google_service_account.vllm_gsa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[${var.k8s_namespace}/${var.k8s_sa_name}]"
  depends_on         = [google_container_cluster.this]
}
