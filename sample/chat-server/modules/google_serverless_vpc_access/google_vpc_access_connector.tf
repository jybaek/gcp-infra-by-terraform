resource "google_vpc_access_connector" "connector" {
  name          = var.vpc_conn_name
  ip_cidr_range = "10.8.0.0/28"
  region        = var.region
  network       = "default"
}