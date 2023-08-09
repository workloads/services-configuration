variable "csp_configuration" {
  # The upstream value of `csp_configuration` in `workloads/workspaces` is a complex list of objects.
  # To allow for processing through TFC, the value is JSON-encoded, resulting in a change of the type to `string`
  type = string

  description = "Project-wide List of Cloud Service Providers (CSPs)."

  # the default for this variable is set in `workloads/workspaces`
}

locals {
  csp_configuration_full = jsondecode(var.csp_configuration)

  # selective CSP Configuration, only contains `enabled` providers
  csp_configuration = [
    for key, value in local.csp_configuration_full : local.csp_configuration_full[key] if value.enabled == true
  ]
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/boundary_cluster#username
variable "hcp_boundary_admin_auth_method_id" {
  type        = string
  description = "HCP Boundary Cluster Admin Auth Method Identifier."
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/boundary_cluster#password
variable "hcp_boundary_admin_password" {
  type        = string
  description = "HCP Boundary Cluster Admin Password."
  sensitive   = true
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/boundary_cluster#username
variable "hcp_boundary_admin_username" {
  type        = string
  description = "HCP Boundary Cluster Admin Username."
}

# this value is set in the `Boundary` Variable Set, inside Terraform Cloud
# see https://app.terraform.io/app/workloads/settings/varsets/
variable "hcp_boundary_cluster_id" {
  type        = string
  description = "The ID of the HCP Boundary Cluster."
}

# this value is set in the `Vault` Variable Set, inside Terraform Cloud
# see https://app.terraform.io/app/workloads/settings/varsets/
variable "hcp_vault_cluster_id" {
  type        = string
  description = "The ID of the HCP Vault Cluster."
}

# this value is set in the `Vault` Variable Set, inside Terraform Cloud
# see https://app.terraform.io/app/workloads/settings/varsets/
variable "hcp_vault_token" {
  type        = string
  description = "The Token of the HCP Vault Cluster."
  sensitive   = true
}

variable "management_region_google" {
  type        = string
  description = "Google-specific `Management` Region Identifier."
}

variable "project_identifier" {
  type        = string
  description = "Human-readable Project Identifier."
}
