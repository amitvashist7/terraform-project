variable "region" {
  default = "us-west1"
}

variable "region_zone" {
  default = "us-west1-b"
}

variable "project_name" {
  description = "The ID of the Google Cloud project"
  default = "k8s-terraform-demo-272708"
}

variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default     = "/home/terrafrom07/.ssh/account.json"
}

variable "public_key_path" {
  description = "Path to file containing public key"
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_key_path" {
  description = "Path to file containing private key"
  default     = "~/.ssh/id_rsa"
}

variable "install_script_src_path" {
  description = "Path to install script within this repository"
  default     = "scripts/install.sh"
}

variable "install_script_dest_path" {
  description = "Path to put the install script on each destination resource"
  default     = "/tmp/install.sh"
}
