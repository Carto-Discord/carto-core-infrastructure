resource "google_storage_bucket" "terraform_state" {
  name          = "${var.project_id}-tfstate"
  location      = var.location
  force_destroy = true
}

resource "google_storage_bucket_access_control" "terraform_rule" {
  bucket = google_storage_bucket.terraform_state.name
  role   = "WRITER"
  entity = "user-${google_service_account.terraform_sa.email}"
}
