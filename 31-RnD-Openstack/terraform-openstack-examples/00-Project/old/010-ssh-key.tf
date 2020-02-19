# Define ssh to config in instance

resource "openstack_compute_keypair_v2" "user_key" {
  name       = "user-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmnzmLiVwKL/wS7JZ/tbX11zQVAx6OLU7c6Wwb1YM2oDHR0PYr2w6HOhNQxRhn2onRW9rzMKJhaLjexm8+a4peVvspzzBKydzDnfP7R7ajSXuAEc6sMUyR/+iY87Yg0Kv5CYwFuXVRSnF9c8X0H4beoirTDEe0DWw2q4ui9WRH7/s/PURaU8r4OkhF5+4UdzLLzeujGuPBSjuHQnbBALoqf4z6xKtq9lLA2Fw2T+scpqZ8BGetaSupgxiFDSAXqS0cMgOENRCwd+kBWG3ReYAijnLIEcyKtqNpZuCmU1cgo6eZU88EyadpZJOTA+BPIfrdSGpq/Ojil+XuFPid3Tpb Generated-by-Nova"
}

