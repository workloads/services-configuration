terraform {
  # see https://developer.hashicorp.com/terraform/language/settings/terraform-cloud
  cloud {
    # see https://developer.hashicorp.com/terraform/cli/cloud/settings#organization
    organization = "workloads"

    # see https://developer.hashicorp.com/terraform/cli/cloud/settings#workspaces
    workspaces {
      name = "services-configuration"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/boundary/1.1.3
    boundary = {
      source = "hashicorp/boundary"
      version = "1.1.3"
    }

    # see https://registry.terraform.io/providers/hashicorp/hcp/0.53.0/
    hcp = {
      source  = "hashicorp/hcp"
      version = ">= 0.53.0, < 1.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/vault/3.12.0
    vault = {
      source = "hashicorp/vault"
      version = "3.12.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.3.0"
}
