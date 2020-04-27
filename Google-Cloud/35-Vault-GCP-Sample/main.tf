provider "vault" {
  address = "${var.address}"
}

data "vault_generic_secret" "default" {
  path = "gcp/token/terraform-gcp-roleset"
}

provider "google" {
  access_token = "${data.vault_generic_secret.default.data["token"]}"
  project      = "${var.project}"
  region       = "${var.region}"
}

resource "google_storage_bucket" "default" {
  project = "${var.project}"
  name    = "${var.name}"
}
