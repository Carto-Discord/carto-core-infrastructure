resource "google_service_account" "terraform_sa" {
  account_id   = "terraform"
  display_name = "Terraform Service Account"
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
