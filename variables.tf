# see https://registry.terraform.io/providers/auth0/auth0/latest/docs#client_id
variable "auth0_client_id" {
  type        = string
  description = "Auth0 Client ID."
}

# see https://registry.terraform.io/providers/auth0/auth0/latest/docs#client_secret
variable "auth0_client_secret" {
  type        = string
  description = "Auth0 Client Secret."
}

# see https://registry.terraform.io/providers/auth0/auth0/latest/docs#domain
variable "auth0_domain" {
  type        = string
  description = "Auth0 Domain Name."
}

# The upstream value of `csp_configuration` in `workloads/workspaces` is a complex list of objects.
# To allow for processing through TFC, the value is JSON-encoded, resulting in a change of the type to `string`
variable "csp_configuration" {
  type = list(object({
    name    = string
    prefix  = string
    enabled = bool
  }))

  description = "Project-wide List of Cloud Service Providers (CSPs)."

  # the default for this variable is set in `workloads/workspaces`
}

locals {
  csp_configuration_full = var.csp_configuration

  # selective CSP Configuration, only contains `enabled` providers
  # assigning `value` as the full value of each object results in duplication of `value.prefix` in the output
  # but it allows for easier consumption of the `value.prefix` because it foregoes approaches such as `keys()`
  csp_configuration = tomap({
    for value in local.csp_configuration_full :
    value.prefix => value
    if value.enabled == true
  })
}

variable "google_project_id" {
  type        = string
  description = "The Project ID to use for authenticating with GCP."
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

variable "management_region_aws" {
  type        = string
  description = "AWS-specific `Management` Region Identifier."
}

variable "management_region_gcp" {
  type        = string
  description = "Google-specific `Management` Region Identifier."
}

variable "project_identifier" {
  type        = string
  description = "Human-readable Project Identifier."
}
