provider "google" {
  credentials = file("/home/terrafrom07/.ssh/account.json")
  project     = "k8s-terraform-demo-272708"
  region      = "us-west1"
}

provider "google" {
  credentials = file("/home/terrafrom07/.ssh/account.json")
  project     = "k8s-terraform-demo-272708"
  region      = "us-central1"
  alias       = "myregion"
}

variable "us-west-zones" {
  default = ["us-west1-a", "us-west1-b"]
}

variable "us-central-zones" {
  default = ["us-central1-a", "us-central1-b"]
}


resource "google_compute_instance" "west_frontend" {
  depends_on 		= [google_compute_instance.west_backend]
  name     		= "west-frontend-${count.index}"
  count    		= 2
  zone     		= var.us-west-zones[count.index]
  machine_type 		= "f1-micro"
  boot_disk {
    initialize_params {
      image 		= "debian-cloud/debian-9"
    }
  }
  network_interface {
    # A default network is created for all GCP projects
    network       	= "default"
    access_config {
    }
  }
}

resource "google_compute_instance" "frontend" {
  provider      	= google.myregion
  depends_on 		= [google_compute_instance.backend]
  name     		= "frontend-${count.index}"
  count    		= 2
  zone     		= var.us-central-zones[count.index]
  machine_type 		= "f1-micro"
  boot_disk {
    initialize_params {
      image 		= "debian-cloud/debian-9"
    }
  }
  network_interface {
    # A default network is created for all GCP projects
    network    		 = "default"
    access_config {
    }
  }
}


resource "google_compute_instance" "backend" {
  provider      		= google.myregion
  name         			= "backend-${count.index}"
  machine_type 			= "f1-micro"
  count                 	= 2
  zone     			= var.us-central-zones[count.index]
  boot_disk {
    initialize_params {
      image 			= "debian-cloud/debian-9"
    }
  }
  network_interface {
    # A default network is created for all GCP projects
    network       		= "default"
    access_config {
    }
  }
  lifecycle {
    prevent_destroy = false
  }
}


resource "google_compute_instance" "west_backend" {
  name         			= "west-backend-${count.index}"
  machine_type 			= "f1-micro"
  count                 	= 2
  zone     			= var.us-west-zones[count.index]
  boot_disk {
    initialize_params {
      image 			= "debian-cloud/debian-9"
    }
  }
  network_interface {
    # A default network is created for all GCP projects
    network       		= "default"
    access_config {
    }
  }
  lifecycle {
    prevent_destroy = false
  }
}


#output "backend_ips" {
#  value = "${list ("${google_compute_instance.backend[*].network_interface[0].access_config[0].nat_ip}","${google_compute_instance.backend[*].network_interface[0].network_ip}")}"
#}



output "frontend" {
  value = "${google_compute_instance.frontend[*].network_interface[0].access_config[0].nat_ip}"
}

output "backend" {
  value = "${google_compute_instance.backend[*].network_interface[0].access_config[0].nat_ip}"
}

output "frontend_west" {
  value = "${google_compute_instance.west_frontend[*].network_interface[0].access_config[0].nat_ip}"
}

output "backend_west" {
  value = "${google_compute_instance.west_backend[*].network_interface[0].access_config[0].nat_ip}"
}
