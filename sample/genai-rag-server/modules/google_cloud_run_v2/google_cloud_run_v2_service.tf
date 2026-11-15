resource "google_service_account" "rag_sa" {
  account_id   = "${var.service_name}-sa"
  display_name = "GenAI RAG Cloud Run Service Account"
  project      = var.project_id
}

resource "google_project_iam_member" "vertex_ai_user" {
  project = var.project_id
  role    = "roles/aiplatform.user"
  member  = "serviceAccount:${google_service_account.rag_sa.email}"
}

resource "google_project_iam_member" "alloydb_client" {
  project = var.project_id
  role    = "roles/alloydb.client"
  member  = "serviceAccount:${google_service_account.rag_sa.email}"
}

resource "google_storage_bucket_iam_member" "docs_reader" {
  bucket = var.docs_bucket
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.rag_sa.email}"
}

resource "google_cloud_run_v2_service" "this" {
  name                = var.service_name
  project             = var.project_id
  location            = var.region
  deletion_protection = false

  template {
    service_account = google_service_account.rag_sa.email

    vpc_access {
      egress = "PRIVATE_RANGES_ONLY"
      network_interfaces {
        network    = var.network_name
        subnetwork = var.subnetwork_name
      }
    }

    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"

      env {
        name  = "ALLOYDB_HOST"
        value = var.alloydb_ip
      }

      env {
        name  = "DOCS_BUCKET"
        value = var.docs_bucket
      }

      env {
        name  = "VERTEX_LOCATION"
        value = var.region
      }
    }
  }
}
