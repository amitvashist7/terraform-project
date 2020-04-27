provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  password    = "keystone"
  auth_url    = "http://10.20.20.1:5000/v3/"
#  region      = "regionOne"
}
