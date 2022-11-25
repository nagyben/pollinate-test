resource "google_app_engine_application" "app" {
  location_id = "europe-west" // multi-region firestore db (replicated across Belgium & Netherlands, parity in Finland)
  database_type = "CLOUD_FIRESTORE"
}