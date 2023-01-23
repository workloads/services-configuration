# create Vault Admin Token to be able to make changes to HCP Vault configuration
# ⚠️ Note that this will persist a Vault Admin Token to Terraform State.
# ⚠️ Disabling this resource does NOT invalidate the provisioned admin token.
# for more guidance, see https://www.terraform.io/language/state/sensitive-data
# and https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/vault_cluster_admin_token
resource "hcp_vault_cluster_admin_token" "main" {
  cluster_id = var.hcp_vault_cluster_id
}
