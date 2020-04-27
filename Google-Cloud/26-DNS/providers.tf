provider "google" {
  credentials = "${file("/home/terrafrom07/.ssh/account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}
