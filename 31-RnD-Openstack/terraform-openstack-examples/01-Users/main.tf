resource "openstack_identity_project_v3" "project_1" {
  name = "mytestproject"
}

resource "openstack_identity_user_v3" "user_1" {
  default_project_id = "${openstack_identity_project_v3.project_1.id}"
  name               = "user_1"
  description        = "A user"

  password = "password123"

  ignore_change_password_upon_first_use = true

  multi_factor_auth_enabled = true

  multi_factor_auth_rule {
    rule = ["password", "totp"]
  }

  multi_factor_auth_rule {
    rule = ["password"]
  }

  extra = {
    email = "user_1@foobar.com"
  }
}

