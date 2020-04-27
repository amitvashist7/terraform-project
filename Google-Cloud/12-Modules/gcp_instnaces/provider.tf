provider "google" {
  project     = "${var.project}"
  credentials = "${file("/home/terrafrom07/.ssh/account.json")}"
  region      = "${var.region}"
}
