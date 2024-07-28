# The AWS Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#schema
provider "aws" {
  access_key = var.aws_access_key
  region     = var.management_region_aws
  secret_key = var.aws_secret_access_key

  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#default_tags
  default_tags {
    tags = {
      "github:url" = "https://github.com/workloads/services-configuration"
    }
  }
}

# The HCP Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/guides/auth
provider "hcp" {}

# ⚠️ Note that this will persist a Boundary Admin Token to Terraform State.
# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs
provider "boundary" {
  addr                   = data.hcp_boundary_cluster.main.cluster_url
  auth_method_id         = var.hcp_boundary_admin_auth_method_id
  auth_method_login_name = var.hcp_boundary_admin_username
  auth_method_password   = var.hcp_boundary_admin_password
  #scope_id               = "global"
  tls_insecure = false
}

# The TFE Provider is set to retrieve configuration from `variables.tf` and the environment
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs
provider "tfe" {
  alias = "viewer"

  hostname        = "app.terraform.io"
  ssl_skip_verify = false
  token           = var.tfe_team_token_viewers
}

# ⚠️ Note that this will persist a Vault Admin Token to Terraform State.
# see https://registry.terraform.io/providers/hashicorp/vault/latest/docs#schema
provider "vault" {
  address   = data.hcp_vault_cluster.main.vault_public_endpoint_url
  namespace = data.hcp_vault_cluster.main.namespace
  token     = var.hcp_vault_token
}
