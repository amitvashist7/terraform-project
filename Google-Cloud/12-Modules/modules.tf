module "instance" {
  source = "./gcp_instnaces"
}



module "frontend" {
  source = "./gcp_instnaces"
  environment-name = "frontend"
  region = "us-central1"
}


module "backend" {
  source = "./gcp_instnaces"
  environment-name = "backend"
  total_instances = 2
}
