#################################################
####  		 Terraform 12		     ####
#################################################

resource "google_compute_autoscaler" "autoscale" {
  name   = "my-autoscaler"
  zone   = "us-west1-a"
  target = google_compute_instance_group_manager.autoscale.id

  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 1
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}

resource "google_compute_instance_template" "autoscale" {
  name           = "myinstancetemp"
  machine_type   = "f1-micro"
  can_ip_forward = false

  tags = ["foo", "bar"]

  disk {
    source_image = data.google_compute_image.debian_9.self_link
  }

  network_interface {
    network = "default"
  }

  metadata = {
    foo = "bar"
  }

}

resource "google_compute_target_pool" "autoscale" {
  name = "my-target-pool"
}

resource "google_compute_instance_group_manager" "autoscale" {
  name = "my-igm"
  zone = "us-west1-a"

  version {
    #instance_template  = google_compute_instance_template.autoscale.id
    instance_template  = google_compute_instance_template.autoscale.self_link
    name               = "primary"
  }

  target_pools       = [google_compute_target_pool.autoscale.self_link]
  base_instance_name = "autoscale"
}

data "google_compute_image" "debian_9" {
  family  = "debian-9"
  project = "debian-cloud"
}
