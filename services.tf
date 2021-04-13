resource "google_project_service" "cloud_build" {
  project = var.project_id
  service = "cloudbuild.googleapis.com"

  disable_dependent_services = true
}

resource "google_project_service" "app_engine" {
  project = var.project_id
  service = "appengine.googleapis.com"

  disable_dependent_services = true
}

resource "google_project_service" "cloud_functions" {
  project = var.project_id
  service = "cloudfunctions.googleapis.com"

  disable_dependent_services = true
}

resource "google_project_service" "cloud_storage" {
  project = var.project_id
  service = "storage-component.googleapis.com"

  disable_dependent_services = true
}
