resource "google_project_service" "cloud_build" {
  project = var.project_id
  service = "cloudbuild.googleapis.com"

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

resource "google_project_service" "compute_engine" {
  project = var.project_id
  service = "compute.googleapis.com"

  disable_dependent_services = true
}

resource "google_project_service" "iam_service" {
  project = var.project_id
  service = "iam.googleapis.com"

  disable_dependent_services = true
}

resource "google_project_service" "cloudfirestore_service" {
  project = var.project_id
  service = "firestore.googleapis.com"

  disable_dependent_services = true
}

resource "google_project_service" "containerregistry_service" {
  project = var.project_id
  service = "containerregistry.googleapis.com"

  disable_dependent_services = true
}

resource "google_project_service" "cloudrun_service" {
  project = var.project_id
  service = "run.googleapis.com"

  disable_dependent_services = true
}
