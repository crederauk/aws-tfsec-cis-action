resource "google_bigquery_table" "sheet" {
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "sheet"

  encryption_configuration {
    kms_key_name = google_kms_crypto_key.crypto_key.id
  }
}