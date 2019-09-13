/*
 * Copyright 2019 Google LLC. This software is provided as-is, without warranty
 * or representation for any use or purpose. Your use of it is subject to your 
 * agreement with Google.  
 */
provider "google" {
  #   credentials = "${file(var.gcp_credentials_path)}"
        version = "~> 2.5"
}

# provider "google-beta" {
#   credentials = "${file(var.gcp_credentials_path)}"
#   version     = "~> 2.0.0"
# }

# terraform {
#   backend "gcs" {
#     bucket = "apszaz-tfstate"
#     prefix = "hec/demo-setup"
#   }
# }
