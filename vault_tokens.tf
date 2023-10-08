# see https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/token
resource "vault_token" "csp_projects" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = {
    for csp in local.csp_configuration :
    csp.prefix => csp
  }

  metadata = {
    "purpose"         = "service-account"
    "provider-prefix" = each.value.prefix
  }

  no_default_policy = false
  no_parent         = true
  period            = "1h"

  policies = [
    "default", # TODO: remove or update
    vault_policy.boundary_controller.name,
  ]

  renewable = true
}

