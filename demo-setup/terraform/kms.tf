# Key that will be used for encrypting sensitive data in the pipeline.
resource "google_kms_crypto_key" "cloudbuild_key" {
  name     = "cloudbuild-key"
  key_ring = "${google_kms_key_ring.cloudbuild_keyring.self_link}"

  lifecycle {
    prevent_destroy = true
  }
}

# keyring where the key will be stored.
resource "google_kms_key_ring" "cloudbuild_keyring" {
  project  = "${var.pipeline_project}"
  name     = "cloudbuild-secrets"
  location = "global"
}

# grant the Cloud Build service account permission to decrypt data using the 
# key that was created for encrypting secrets.
resource "google_kms_crypto_key_iam_member" "cloudbuild_sa_decrypt" {
  crypto_key_id = "${google_kms_crypto_key.cloudbuild_key.self_link}"
  role          = "roles/cloudkms.cryptoKeyDecrypter"
  member        = "${local.cloudbuild_sa}"

  depends_on = ["google_project_service.project"]
}

resource "google_kms_crypto_key_iam_member" "cloudbuild_sa_encrypt" {
  crypto_key_id = "${google_kms_crypto_key.cloudbuild_key.self_link}"
  role          = "roles/cloudkms.cryptoKeyEncrypter"
  member        = "${local.cloudbuild_sa}"

  depends_on = ["google_project_service.project"]
}
