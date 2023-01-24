module "vault_kv_v2_" {
  source = "git@github.com:ksatirli/terraform-vault-kv-v2.git?ref=updates-structure"
  #version = "0.9.0"

  cas_required      = true
  max_versions      = 3
  mount_description = "Terraform-managed KV (v2) Secret Backend."
  mount_path        = "kv"
}
