resource "google_storage_bucket" "remote_state" {
  project       = "${var.pipeline_project}"
  name          = "${var.gcs_remote_state}"
  location      = "EU"
  force_destroy = true
}

resource "google_storage_bucket_iam_binding" "cloudsource_sa" {
  bucket = "${google_storage_bucket.remote_state.name}"
  role   = "roles/storage.objectAdmin"

  members = [
    "${local.cloudbuild_sa}",
  ]
}
