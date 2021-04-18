resource "google_app_engine_application" "app" {
  project     = var.project_id
  location_id = var.location_id

  database_type = "CLOUD_FIRESTORE"
}
