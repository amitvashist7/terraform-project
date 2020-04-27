provider "google" {
  credentials = "/home/terrafrom07/.ssh/account.json"
  project      = "k8s-terraform-demo-272708"
  region       = "us-west1"
}		
//
// INSTANCES
//
data "google_compute_zones" "us-west1" {}

resource "google_compute_instance" "hyperspace-be" {
  name         = "hyperspace-be"
  machine_type = "n1-standard-1"
  zone         = "us-west1-a"

 boot_disk {                        
   initialize_params {              
     image = "hyperspace-be"
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

resource "google_compute_instance" "hyperspace-fe" {
  name         = "${format("hyperspace-fe-%d", count.index)}"
  machine_type = "f1-micro"
  zone         = "${data.google_compute_zones.us-west1.names[count.index]}"
  tags         = ["hyperspace-fe"]

 boot_disk {                        
   initialize_params {              
     image = "hyperspace-fe"
   }                                
 }                                  

  network_interface {
      network = "default"
      access_config {
          // Ephemeral IP
      }
  }
  count = 3
  lifecycle = {
    create_before_destroy = true
  }
}

//
// NETWORKING
//
resource "google_compute_firewall" "fwrule" {
    name = "hyperspace-web"
    network = "default"
    allow {
        protocol = "tcp"
        ports = ["80"]
    }
    target_tags = ["hyperspace-fe"]
}

resource "google_compute_forwarding_rule" "fwd_rule" {
    name = "fwdrule"
    target = "${google_compute_target_pool.tpool.self_link}"
    port_range = "80"
}

resource "google_compute_target_pool" "tpool" {
    name = "tpool"
    instances = [
        "${google_compute_instance.hyperspace-fe.*.self_link}"
    ]
}

output "lb_ip" {
  value = "${google_compute_forwarding_rule.fwd_rule.ip_address}"
}
