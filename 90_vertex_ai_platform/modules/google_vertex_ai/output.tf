output "workbench_name" {
  value = google_workbench_instance.this.name
}

output "vector_index_id" {
  value = google_vertex_ai_index.this.id
}

output "vector_endpoint_id" {
  value = google_vertex_ai_index_endpoint.this.id
}
