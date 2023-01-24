# Terraform Cloud Workspace: `services-configuration`

> This directory manages the lifecycle of the services configuration for [@workloads](https://github.com/workloads).

## Table of Contents

<!-- TOC -->
* [Terraform Cloud Workspace: `services-configuration`](#terraform-cloud-workspace--services-configuration)
  * [Table of Contents](#table-of-contents)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Notes](#notes)
  * [Author Information](#author-information)
  * [License](#license)
    * [Inputs](#inputs-1)
    * [Outputs](#outputs-1)
<!-- TOC -->

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| hcp_boundary_admin_auth_method_id | HCP Boundary Cluster Admin Auth Method Identifier. | `string` | yes |
| hcp_boundary_admin_password | HCP Boundary Cluster Admin Password. | `string` | yes |
| hcp_boundary_admin_username | HCP Boundary Cluster Admin Username. | `string` | yes |
| hcp_boundary_cluster_id | The ID of the HCP Boundary Cluster. | `string` | yes |
| hcp_vault_cluster_id | The ID of the HCP Vault Cluster. | `string` | yes |
| hcp_vault_token | The Token of the HCP Vault Cluster. | `string` | yes |
| project_identifier | Human-readable Project Identifier. | `string` | yes |
| providers | the providers variable allows for delineation of resources for multiple Cloud Service Providers (CSPs) | <pre>list(object({<br>    name = string<br>  }))</pre> | no |

### Outputs

| Name | Description |
|------|-------------|
| boundary_scope_global | Exported Attributes for `boundary_scope.global`. |
| boundary_scope_project | Exported Attributes for `boundary_scope.project`. |
| hcp_boundary_cluster | Exported Attributes for `hcp_boundary_cluster` data source. |
| hcp_vault_cluster | Exported Attributes for `hcp_vault_cluster` data source. |
| vault_kv_v2_vault_kv_secret_backend_v2 | Exported Attributes for `module.vault_kv_v2.vault_kv_secret_backend_v2`. |
| vault_kv_v2_vault_mount | Exported Attributes for `module.vault_kv_v2.vault_mount`. |
<!-- END_TF_DOCS -->

## Notes

1.) This workspace consumes output information from [workloads/services-deployment](https://github.com/workloads/services-deployment) through [Terraform Cloud Workspace Variables](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables).
Specifically, credentials for HCP Boundary and HCP Vault are passed through sensitive variables.

This constraint is intentional. Due to the nature of the deployed services, we opted to maintain token creation in `services-deployment`, as an eligible token should only be provisioned (and made available to `services-configuration`) when all applies inside `services-configuration` succeed.

We believe this approach to provide predictable guardrails, resulting in a more consistent operator experience

## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/workloads/services-configuration/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| hcp_boundary_admin_password | HCP Boundary Cluster Admin Password. | `string` | yes |
| hcp_boundary_admin_username | HCP Boundary Cluster Admin Username. | `string` | yes |
| hcp_vault_cluster_id | The ID of the HCP Vault Cluster. | `string` | yes |

### Outputs

No outputs.
<!-- END_TF_DOCS -->
