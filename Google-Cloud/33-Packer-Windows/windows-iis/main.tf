provider "google" {
  credentials = "/home/terrafrom07/.ssh/account.json"
  project      = "k8s-terraform-demo-272708"
  region       = "us-west1"
}

//
// INSTANCES
//
resource "google_compute_instance" "windows-iis" {
  name         = "windows-iis"
  machine_type = "n1-standard-1"
  zone         = "us-west1-a"
  tags = ["windows-iis"]

  boot_disk {
    initialize_params {
      image = "windows-server-2016-iis"
    }
  }

  network_interface {
      network = "default"
      access_config {
          // Ephemeral IP
      }
  }
  count = 1
  lifecycle = {
    create_before_destroy = true
  }
}

//
// NETWORKING
//
resource "google_compute_firewall" "fwrule" {
    name = "windows-iis-web"
    network = "default"
    allow {
        protocol = "tcp"
        ports = ["80"]
    }
    target_tags = ["windows-iis"]
}

