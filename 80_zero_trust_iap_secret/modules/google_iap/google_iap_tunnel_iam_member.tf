resource "google_iap_tunnel_iam_member" "tunnel_accessor" {
  project = var.project_id
  role    = "roles/iap.tunnelResourceAccessor"
  member  = "serviceAccount:${var.accessor_sa_email}"
}
