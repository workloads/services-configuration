output "hcp_vault_cluster" {
  description = "Exported Attributes for `hcp_vault_cluster` data source."
  value       = data.hcp_vault_cluster.main
}

output "vault_kv_v2_vault_mount" {
  description = "Exported Attributes for `module.vault_kv_v2.vault_mount`."
  value       = module.vault_kv_v2.vault_mount
}

output "vault_kv_v2_vault_kv_secret_backend_v2" {
  description = "Exported Attributes for `module.vault_kv_v2.vault_kv_secret_backend_v2`."
  value       = module.vault_kv_v2.vault_kv_secret_backend_v2
}

output "hcp_boundary_cluster" {
  description = "Exported Attributes for `hcp_boundary_cluster` data source."
  value       = data.hcp_boundary_cluster.main
}

output "boundary_scope_global" {
  description = "Exported Attributes for `boundary_scope.global`."
  value       = boundary_scope.global
}

output "boundary_scope_organization" {
  description = "Exported Attributes for `boundary_scope.organization`."
  value       = boundary_scope.organization
}

#output "boundary_scope_csp_projects" {
#  description = "Exported Attributes for `boundary_scope.csp_projects`."
#
#  value = {
#    for csp in boundary_scope.csp_projects : csp => csp.name
#  }
#}
