resource "google_storage_bucket" "amitvashist7-terraform-state" {
  name          = "amitvashist7-terraform-state"
  location      = "${var.location}"
  force_destroy = true
}
