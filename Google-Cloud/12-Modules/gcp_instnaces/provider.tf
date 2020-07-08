provider "google" {
  project     = var.project
  credentials = file("/tmp/account.json")
  region      = var.region
}
