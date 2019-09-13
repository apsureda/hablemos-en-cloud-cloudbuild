# For the purpose of this demo, we will grant the Cloud Build service account
# the owner role in this project. This will allow creating any desired resources
# inside the project.
resource "google_project_iam_member" "cloudbuild_owner" {
  project = "${var.pipeline_project}"
  role    = "roles/owner"
  member  = "${local.cloudbuild_sa}"
}

# find the project number. We need it to identify the Cloud Build service
# account for the project.
data "google_project" "cloudbuild_project" {
  project_id = "${var.pipeline_project}"
}

locals {
  cloudbuild_sa = "serviceAccount:${data.google_project.cloudbuild_project.number}@cloudbuild.gserviceaccount.com"
}
