provider "google" {
  credentials = file("/home/terrafrom07/.ssh/account.json")
  project     = "k8s-terraform-demo-272708"
  region      = "us-west1"
  zone        = "us-west1-c"
}

resource "google_compute_instance" "frontend" {
  name         = "frontend"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}

resource "google_compute_instance" "backend" {
  name         = "backend-${count.index}"
  machine_type = "f1-micro"
  count                 = 2
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}


output "frontend_ip" {
  value = "${google_compute_instance.frontend.network_interface[0].network_ip}"
}

output "frontend_ip_pub" {
  value = "${google_compute_instance.frontend.network_interface[0].access_config[0].nat_ip}"
}


output "backend_ip_pub" {
  value = "${google_compute_instance.backend[*].network_interface[0].access_config[0].nat_ip}"
}


output "backend_ips" {
  value = "${list ("${google_compute_instance.backend[*].network_interface[0].access_config[0].nat_ip}","${google_compute_instance.backend[*].network_interface[0].network_ip}")}"
}
