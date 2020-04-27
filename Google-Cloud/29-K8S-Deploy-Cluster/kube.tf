module "kubernetes" {
  source = "./kubernetes"
  region = "us-east1"

  project_id_map = {
    default = "k8s-terraform-demo-272708"
  }
}

output "connection-command" {
  value = "${module.kubernetes.connect-string}"
}
