# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope
resource "boundary_scope" "global" {
  global_scope = true
  scope_id     = "global"
}

# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope
resource "boundary_scope" "project" {
  name                   = var.project_identifier
  description            = "Terraform-managed Boundary Project Scope for `${var.project_identifier}`."
  scope_id               = boundary_scope.global.id

  # avoid resources that are not managed by Terraform by disabling automatic creation of roles
  auto_create_admin_role = false
  auto_create_default_role = false
}
