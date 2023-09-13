# see https://developer.hashicorp.com/boundary/docs/concepts/domain-model/credential-stores#vault-boundary-controller-policy
# and https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document
data "vault_policy_document" "boundary_controller" {
  rule {
    path = "auth/token/lookup-self"

    capabilities = [
      "read",
    ]
  }

  rule {
    path = "auth/token/renew-self"

    capabilities = [
      "update",
    ]
  }

  rule {
    path = "auth/token/revoke-self"

    capabilities = [
      "update",
    ]
  }

  rule {
    path = "sys/leases/renew"

    capabilities = [
      "update",
    ]
  }

  rule {
    path = "sys/leases/revoke"

    capabilities = [
      "update",
    ]
  }

  rule {
    path = "sys/capabilities-self"

    capabilities = [
      "update",
    ]
  }
}

# see https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy
resource "vault_policy" "boundary_controller" {
  name   = "boundary-controller"
  policy = data.vault_policy_document.boundary_controller.hcl
}
