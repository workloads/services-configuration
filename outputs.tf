output "boundary_scope_global" {
  description = "Exported Attributes for `boundary_scope.global`."
  value       = boundary_scope.global
}

output "boundary_scope_organization" {
  description = "Exported Attributes for `boundary_scope.organization`."
  value       = boundary_scope.organization
}

output "boundary_scopes_csps" {
  description = "Exported Attributes for `module.boundary_csp_projects.boundary_scope`."
  value       = module.boundary_csp_projects
  sensitive   = true
}

output "datadog_urls" {
  description = "URLs for Datadog Services."

  value = {
    hcp_streaming_logs = "https://app.datadoghq.com/logs?query=service%3A%22HCP%20-%20HCP-Streaming%22"
  }
}

output "hcp_boundary_cluster" {
  description = "Exported Attributes for `hcp_boundary_cluster` data source."
  value       = data.hcp_boundary_cluster.main
}

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
