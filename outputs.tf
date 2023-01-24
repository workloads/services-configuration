output "hcp_vault_cluster" {
  description = "Exported Attributes for `hcp_vault_cluster` data source."
  value = data.hcp_vault_cluster.main
}

output "vault_kv_v2_vault_mount" {
  description = "Exported Attributes for `module.vault_kv_v2.vault_mount`."
  value       = module.vault_kv_v2.vault_mount
}

output "vault_kv_v2_vault_kv_secret_backend_v2" {
  description = "Exported Attributes for `module.vault_kv_v2.vault_kv_secret_backend_v2`."
  value       = module.vault_kv_v2.vault_kv_secret_backend_v2
}

