/*
 * Copyright 2019 Google LLC. This software is provided as-is, without warranty
 * or representation for any use or purpose. Your use of it is subject to your 
 * agreement with Google.  
 */
variable "gcp_credentials_path" {
  description = "The path to the GCP credentials file (json key)."
}

variable "pipeline_project" {
  description = "The project where the Cloud Build pipeline will run."
}

variable "pipeline_project_services" {
  description = "The GCP services required to run the pipeline."
  type        = "list"
}

variable "source_repo" {
  description = "The git repository where the pipeline code will be stored."
}

variable "git_user_name" {
  description = "The user name used in automated git commits."
  default     = "Automated Build Pipeline"
}

variable "git_user_email" {
  description = "The user used used in automated git commits."
}

variable "gcs_remote_state" {
  description = "The name of the GCS bucket to use for storing the Terraform remote state."
}
