resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "n2d-medium"
  zone         = "us-central1-a"
}