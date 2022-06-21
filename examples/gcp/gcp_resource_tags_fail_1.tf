resource "google_bigquery_dataset" "test-gcp-1" {
  dataset_id                  = "example_dataset"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "US"
  default_table_expiration_ms = 3600000
  labels                      = {
    madefor = "tfsec-custom-tests"
  }

  default_encryption_configuration {
    kms_key_name = google_kms_crypto_key.crypto_key.id
  }
}


resource "google_bigquery_table" "test-gcp-2" {
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "sheet"
  labels     = var.labels

  encryption_configuration {
    kms_key_name = google_kms_crypto_key.crypto_key.id
  }
}

variable "labels" {
  default = {
    madefor = "tfsec-custom-tests"
  }
}
