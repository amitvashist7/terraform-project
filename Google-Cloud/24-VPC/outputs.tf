output "name" {
  value       = "${google_compute_network.new-vpc.name}"
  description = "The unique name of the network"
}
