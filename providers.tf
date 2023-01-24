# The HCP Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/guides/auth
provider "hcp" {}

# ⚠️ Note that this will persist a Boundary Admin Token to Terraform State.
# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs
provider "boundary" {
  addr                            = data.hcp_boundary_cluster.main.cluster_url
  auth_method_id                  = var.hcp_boundary_admin_auth_method_id
  password_auth_method_login_name = var.hcp_boundary_admin_username
  password_auth_method_password   = var.hcp_boundary_admin_password
}

# ⚠️ Note that this will persist a Vault Admin Token to Terraform State.
# see https://registry.terraform.io/providers/hashicorp/vault/latest/docs#schema
provider "vault" {
  address   = data.hcp_vault_cluster.main.vault_public_endpoint_url
  namespace = data.hcp_vault_cluster.main.namespace
  token     = var.hcp_vault_token
}
