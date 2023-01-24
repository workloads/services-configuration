# TODO: replace with TF-managed value
# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/boundary_cluster#username
variable "hcp_boundary_admin_auth_method_id" {
  type        = string
  description = "HCP Boundary Cluster Admin Auth Method Identifier."
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/boundary_cluster#username
variable "hcp_boundary_admin_username" {
  type        = string
  description = "HCP Boundary Cluster Admin Username."
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/boundary_cluster#password
variable "hcp_boundary_admin_password" {
  type        = string
  description = "HCP Boundary Cluster Admin Password."
  sensitive   = true
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

variable "project_identifier" {
  type        = string
  description = "Human-readable Project Identifier."
}
