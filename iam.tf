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

resource "google_project_iam_member" "appengine_binding" {
  project = var.project_id
  role    = "roles/appengine.deployer"
  member  = "serviceAccount:${google_service_account.terraform_sa.email}"
}

resource "google_project_iam_member" "cloudbuild_binding" {
  project = var.project_id
  role    = "roles/cloudbuild.builds.builder"
  member  = "serviceAccount:${google_service_account.terraform_sa.email}"
}

resource "google_project_iam_member" "cloudscheduler_binding" {
  project = var.project_id
  role    = "roles/cloudscheduler.admin"
  member  = "serviceAccount:${google_service_account.terraform_sa.email}"
}

resource "google_project_iam_member" "cloudstorage_binding" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.terraform_sa.email}"
}

resource "google_project_iam_member" "cloudfunctions_binding" {
  project = var.project_id
  role    = "roles/cloudfunctions.admin"
  member  = "serviceAccount:${google_service_account.terraform_sa.email}"
}

resource "google_project_iam_member" "compute_binding" {
  project = var.project_id
  role    = "roles/compute.viewer"
  member  = "serviceAccount:${google_service_account.terraform_sa.email}"
}

resource "google_project_iam_member" "iam_binding" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.terraform_sa.email}"
}
