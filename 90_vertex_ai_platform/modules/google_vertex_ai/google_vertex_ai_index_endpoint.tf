resource "google_vertex_ai_index_endpoint" "this" {
  display_name            = "${var.service_name}-vector-endpoint"
  project                 = var.project_id
  region                  = var.region
  public_endpoint_enabled = true
}
