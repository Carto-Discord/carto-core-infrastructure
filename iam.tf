resource "google_service_account" "terraform_sa" {
  account_id   = "terraform"
  display_name = "Terraform Service Account"
}

resource "google_service_account_key" "terraform_key" {
  service_account_id = google_service_account.terraform_sa.name
}

output "terraform_private_key" {
  value = google_service_account_key.terraform_key.private_key
}

resource "google_project_iam_binding" "appengine_binding" {
  project = var.project_id
  role    = "roles/appengine.deployer"

  members = [
    "serviceAccount:${google_service_account.terraform_sa.email}",
  ]
}

resource "google_project_iam_binding" "cloudbuild_binding" {
  project = var.project_id
  role    = "roles/cloudbuild.builds.builder"

  members = [
    "serviceAccount:${google_service_account.terraform_sa.email}",
  ]
}

resource "google_project_iam_binding" "cloudscheduler_binding" {
  project = var.project_id
  role    = "roles/cloudscheduler.admin"

  members = [
    "serviceAccount:${google_service_account.terraform_sa.email}",
  ]
}

resource "google_project_iam_binding" "cloudstorage_binding" {
  project = var.project_id
  role    = "roles/storage.admin"

  members = [
    "serviceAccount:${google_service_account.terraform_sa.email}",
  ]
}

resource "google_project_iam_binding" "cloudfunctions_binding" {
  project = var.project_id
  role    = "roles/cloudfunctions.developer"

  members = [
    "serviceAccount:${google_service_account.terraform_sa.email}",
  ]
}

resource "google_project_iam_binding" "compute_binding" {
  project = var.project_id
  role    = "roles/compute.viewer"

  members = [
    "serviceAccount:${google_service_account.terraform_sa.email}",
  ]
}

resource "google_project_iam_binding" "iam_binding" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"

  members = [
    "serviceAccount:${google_service_account.terraform_sa.email}",
  ]
}
