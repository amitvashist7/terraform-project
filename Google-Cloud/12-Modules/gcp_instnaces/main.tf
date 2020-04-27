data "google_compute_zones" "available" {}

resource "google_compute_instance" "instance" {
  name     		= "${join("-",list(var.environment-name, "vm"))}"
  count    		= "${var.total_instances}"
  zone     		= "${data.google_compute_zones.available.names[count.index]}"
  machine_type 		= "f1-micro"
  boot_disk {
    initialize_params {
      image 		= "${var.images[var.region]}"
    }
  }
  network_interface {
    # A default network is created for all GCP projects
    network    		 = "default"
    access_config {
    }
  }
}
