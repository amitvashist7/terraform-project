# Specify the provider and access details
# Use Terrafrom 12
provider "aws" {
  region = "us-east-1"
}
module "ecs_cluster" {
  source  = "HENNGE/ecs/aws"
  version = "1.0.0"

  name = "mytest-cluster"
}
