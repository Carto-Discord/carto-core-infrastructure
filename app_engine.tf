data "google_project" "project" {}

resource "google_app_engine_application" "app" {
  project     = data.google_project.project.project_id
  location_id = var.location_id

  database_type = "CLOUD_FIRESTORE"
}
