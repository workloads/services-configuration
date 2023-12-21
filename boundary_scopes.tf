# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope
resource "boundary_scope" "global" {
  description  = "Global Scope"
  global_scope = true
  name         = "global"
  scope_id     = "global"
}

# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope
resource "boundary_scope" "organization" {
  name        = title(var.project_identifier)
  description = "Terraform-managed Scope for `${var.project_identifier}`."
  scope_id    = boundary_scope.global.id

  # avoid resources that aren't managed by Terraform by disabling automatic creation of roles
  auto_create_admin_role   = true
  auto_create_default_role = true
}

# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope
resource "boundary_scope" "csp_projects" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = {
    for csp in local.csp_configuration :
    csp.prefix => csp
  }

  name        = upper(each.key)
  description = "Terraform-managed Scope for ${each.value.name} (`${each.value.prefix}`)."
  scope_id    = boundary_scope.organization.scope_id

  # avoid resources that aren't managed by Terraform by disabling automatic creation of roles
  auto_create_admin_role   = false
  auto_create_default_role = false
}
