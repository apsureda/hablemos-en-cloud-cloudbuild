resource "google_project_service" "project" {
  count   = "${length(var.pipeline_project_services)}"
  project = "${var.pipeline_project}"
  service = "${var.pipeline_project_services[count.index]}"

  disable_dependent_services = true
}
