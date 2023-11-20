terraform {
  # see https://developer.hashicorp.com/terraform/language/settings/terraform-cloud
  cloud {
    # see https://app.terraform.io/app/workloads/workspaces
    # and https://developer.hashicorp.com/terraform/cli/cloud/settings#organization
    organization = "workloads"

    # see https://app.terraform.io/app/workloads/services-configuration
    # and https://developer.hashicorp.com/terraform/cli/cloud/settings#workspaces
    workspaces {
      name = "services-configuration"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/5.26.0
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.26.0, < 6.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/boundary/1.1.10/
    boundary = {
      source  = "hashicorp/boundary"
      version = ">= 1.1.10, < 2.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/hcp/0.77.0/
    hcp = {
      source  = "hashicorp/hcp"
      version = ">= 0.77.0, < 1.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/vault/3.23.0/
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.23.0, < 4.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.6.0, < 2.0.0"
}
