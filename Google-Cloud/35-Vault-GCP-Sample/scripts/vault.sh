#!/bin/bash

project="k8s-terraform-demo-272708"

vault secrets enable gcp

vault write gcp/config credentials=@/home/terrafrom07/.ssh/account.json ttl=3600 max_ttl=86400

vault write gcp/roleset/terraform-gcp-roleset \
	bindings=@gcp.hcl \
	token_scopes="https://www.googleapis.com/auth/cloud-platform" \
	project=$project \
	secret_type="access_token"

vault read gcp/token/terraform-gcp-roleset
