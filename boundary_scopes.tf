# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope
resource "boundary_scope" "global" {
  global_scope = true
  scope_id     = "global"
}

# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope
resource "boundary_scope" "organization" {
  name        = var.project_identifier
  description = "Terraform-managed Boundary Project Scope for `${var.project_identifier}`."
  scope_id    = boundary_scope.global.id

  # avoid resources that are not managed by Terraform by disabling automatic creation of roles
  auto_create_admin_role   = false
  auto_create_default_role = false
}

# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope
resource "boundary_scope" "project" {
  name        = "AWS"
  description = "Terraform-managed Boundary Project for AWS."
  scope_id    = boundary_scope.organization.id

  # avoid resources that are not managed by Terraform by disabling automatic creation of roles
  auto_create_admin_role = false
}

# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope
resource "boundary_scope" "provider_projects" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = {
    for provider in var.providers :
    provider.name => provider
  }

  name        = each.key
  description = "Terraform-managed Boundary Project for ${each.key}."
  scope_id    = boundary_scope.organization.id

  # avoid resources that are not managed by Terraform by disabling automatic creation of roles
  auto_create_admin_role   = false
  auto_create_default_role = false
}