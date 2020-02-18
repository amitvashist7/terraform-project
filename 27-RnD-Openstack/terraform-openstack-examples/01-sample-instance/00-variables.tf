# Params file for variables

#### GLANCE
variable "image" {
  type    = string
  default = "cirros"
}

#### NEUTRON
variable "external_network" {
  type    = string
  default = "external"
}

# UUID of external gateway
variable "external_gateway" {
  type    = string
  default = "cc914a49-e90d-436e-b438-78fc9b1727a9"
}

variable "dns_ip" {
  type    = list(string)
  default = ["8.8.8.8", "8.8.8.4"]
}

#### VM parameters
variable "flavor_http" {
  type    = string
  default = "m1.medium"
}

variable "network_http" {
  type    = map(string)
  default = {
    subnet_name = "subnet-http"
    cidr        = "192.168.1.0/24"
  }
}

