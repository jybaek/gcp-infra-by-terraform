resource "google_vertex_ai_index" "this" {
  display_name        = "${var.service_name}-vector-index"
  project             = var.project_id
  region              = var.region
  index_update_method = "STREAM_UPDATE"

  metadata {
    contents_delta_uri = var.contents_delta_uri
    config {
      dimensions                  = 768
      approximate_neighbors_count = 150
      distance_measure_type       = "DOT_PRODUCT_DISTANCE"
      shard_size                  = "SHARD_SIZE_SMALL"

      algorithm_config {
        tree_ah_config {
          leaf_node_embedding_count    = 500
          leaf_nodes_to_search_percent = 7
        }
      }
    }
  }
}
