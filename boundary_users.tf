# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/role
resource "boundary_user" "admin" {
  name     = var.hcp_boundary_admin_username
  scope_id = boundary_scope.global.id
}

# see https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/role
resource "boundary_role" "cluster_admin" {
  name        = boundary_user.admin.name
  description = "Admin User."

  principal_ids = [
    boundary_user.admin.id
  ]

  grant_strings = [
    "id=*;type=*;actions=*"
  ]

  scope_id = boundary_scope.global.id
}
