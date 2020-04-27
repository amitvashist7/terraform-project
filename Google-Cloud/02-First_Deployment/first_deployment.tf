#########GCP##########
provider "google" {
  credentials = file("account.json")
  project     = "my-project-id"
  region      = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
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




#########AWS##########
provider "aws" {
  access_key = "AWS-ACCESS"
  secret_key = "Key"
  region     = "us-west-2"
}
resource "aws_instance" "example" {
  ami           = "ami-02d0ea44ae3fe9561"
  instance_type = "t2.micro"
}
