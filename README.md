# HCP Terraform Workspace `services-configuration`

> This repository manages services configuration for [@workloads](https://github.com/workloads).

## Table of Contents

<!-- TOC -->
* [HCP Terraform Workspace `services-configuration`](#hcp-terraform-workspace-services-configuration)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
    * [Development](#development)
  * [Usage](#usage)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Notes](#notes)
  * [Contributors](#contributors)
  * [License](#license)
<!-- TOC -->

## Requirements

- HashiCorp Terraform `1.9.x` or [newer](https://developer.hashicorp.com/terraform/downloads)

### Development

For development and testing of this repository:

- `terraform-docs` `0.18.0` or [newer](https://terraform-docs.io/user-guide/installation/)

## Usage

This repository uses a standard Terraform workflow (`init`, `plan`, `apply`).

For more information, including detailed usage guidelines, see the [Terraform documentation](https://developer.hashicorp.com/terraform/cli/commands).

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| auth0_client_id | Auth0 Client ID. | `string` | yes |
| auth0_client_secret | Auth0 Client Secret. | `string` | yes |
| auth0_domain | Auth0 Domain Name. | `string` | yes |
| aws_access_key | AWS Access Key. | `string` | yes |
| aws_secret_access_key | AWS Secret Access Key. | `string` | yes |
| csp_configuration | Project-wide List of Cloud Service Providers (CSPs). | <pre>list(object({<br>    name    = string<br>    prefix  = string<br>    enabled = bool<br>  }))</pre> | yes |
| google_project_id | The Project ID to use for authenticating with GCP. | `string` | yes |
| hcp_boundary_admin_auth_method_id | The ID of the (primary) HCP Boundary Cluster Auth Method. | `string` | yes |
| hcp_boundary_admin_password | HCP Boundary Cluster Admin Password. | `string` | yes |
| hcp_boundary_admin_username | HCP Boundary Cluster Admin Username. | `string` | yes |
| hcp_boundary_cluster_id | The ID of the HCP Boundary Cluster. | `string` | yes |
| hcp_vault_cluster_id | The ID of the HCP Vault Cluster. | `string` | yes |
| hcp_vault_token | The Token of the HCP Vault Cluster. | `string` | yes |
| management_region_aws | AWS-specific `Management` Region Identifier. | `string` | yes |
| management_region_gcp | Google-specific `Management` Region Identifier. | `string` | yes |
| project_identifier | Human-readable Project Identifier. | `string` | yes |

### Outputs

| Name | Description |
|------|-------------|
| boundary_scope_global | Exported Attributes for `boundary_scope.global`. |
| boundary_scope_organization | Exported Attributes for `boundary_scope.organization`. |
| boundary_scopes_csps | Exported Attributes for `module.boundary_csp_projects.boundary_scope`. |
| datadog_urls | URLs for Datadog Services. |
| hcp_boundary_cluster | Exported Attributes for `hcp_boundary_cluster` data source. |
| hcp_vault_cluster | Exported Attributes for `hcp_vault_cluster` data source. |
| vault_kv_v2_vault_kv_secret_backend_v2 | Exported Attributes for `module.vault_kv_v2.vault_kv_secret_backend_v2`. |
| vault_kv_v2_vault_mount | Exported Attributes for `module.vault_kv_v2.vault_mount`. |
<!-- END_TF_DOCS -->

## Notes

1.) This workspace consumes output information from [workloads/services-deployment](https://github.com/workloads/services-deployment) through [HCP Terraform Workspace Variables](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables).
Specifically, credentials for HCP Boundary and HCP Vault are passed through sensitive variables.

This constraint is intentional. Due to the nature of the deployed services, we opted to maintain token creation in `services-deployment`, as an eligible token should only be provisioned (and made available to `services-configuration`) when all applies inside `services-configuration` succeed.

We believe this approach to provide predictable guardrails, resulting in a more consistent operator experience

## Contributors

For a list of current (and past) contributors to this repository, see [GitHub](https://github.com/workloads/services-configuration/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may download a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

See the License for the specific language governing permissions and limitations under the License.
