provider "google" {
  project = "${var.project_id_map[terraform.workspace]}"
  region  = "${var.region}"
  credentials  = "${file("/root/.ssh/gcp-service-account")}"
  #version = "1.8.0"
}
