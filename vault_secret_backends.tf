# see https://registry.terraform.io/modules/ksatirli/kv-v2/vault/latest
module "vault_kv_v2" {
  source  = "ksatirli/kv-v2/vault"
  version = "0.9.0"

  cas_required      = true
  max_versions      = 3
  mount_description = "Terraform-managed KV (v2) Secret Backend."
  mount_path        = "kv"
}
