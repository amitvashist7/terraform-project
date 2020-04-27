variable "address" {
  description = "Vault Server IP"
  default = "https://127.0.0.1:8200"
}

variable "project" {
  description = "GCP Project ID to launch resources in"
  default     = "k8s-terraform-demo-272708"
}

variable "region" {
  description = "Region to launch in"
  default     = "us-central1"
}

variable "name" {
  description = "Bucket Name"
  default     = "terraform-vault-gcp-dynamic-av"
}
