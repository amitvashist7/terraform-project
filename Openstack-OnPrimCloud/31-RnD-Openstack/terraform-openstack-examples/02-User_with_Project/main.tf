resource "openstack_identity_project_v3" "project_1" {
  name = "project-quota"
}

resource "openstack_networking_quota_v2" "quota_1" {
  project_id          = "${openstack_identity_project_v3.project_1.id}"
  floatingip          = 10
  network             = 4
  port                = 100
  rbac_policy         = 10
  router              = 4
  security_group      = 10
  security_group_rule = 100
  subnet              = 8
  subnetpool          = 2
}

