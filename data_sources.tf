# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/data-sources/vault_cluster
data "hcp_vault_cluster" "main" {
  cluster_id = var.hcp_vault_cluster_id
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/data-sources/boundary_cluster
data "hcp_boundary_cluster" "main" {
  cluster_id = var.hcp_boundary_cluster_id
}
