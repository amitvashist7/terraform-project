#########GCP##########
provider "google" {
  credentials = "${file("/home/terrafrom07/.ssh/account.json")}"
  project     = "k8s-terraform-demo-272708"
  region      = "us-west1"
  zone        = "us-west1-c"
}

locals {
  default_name = "${join("-", list(terraform.workspace, "example"))}"
}

resource "google_compute_instance" "vm_instance" {
  name         = "default-test"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-lts"
    }
  }

  metadata = {
   ssh-keys = "ubuntu:${file(var.key_name)}"
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "./frontend"
    destination = "~/"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x ~/frontend/run_frontend.sh",
      "cd ~/frontend",
      "sudo ~/frontend/run_frontend.sh",
    ]
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}

resource "google_compute_firewall" "default" {
 name    = "apache2-firewall"
 network = "default"

 allow {
   protocol = "tcp"
   ports    = ["5000","80","443"]
 }

 lifecycle {
    ignore_changes = ["*"]
}

}

resource "null_resource" "ansible-main" {
  provisioner "local-exec" {
    command = "ansible-playbook -e sshKey=${var.pvt_key} -i '${google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip},' ./ansible/setup-backend.yaml -v"
  }

  depends_on = ["google_compute_instance.vm_instance"]
}

output "ip" {
 value = "${google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip}"
}
