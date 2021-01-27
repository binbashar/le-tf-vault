#=============================#
# AWS Provider Settings       #
#=============================#
provider "aws" {
  alias                   = "main_region"
  region                  = var.region
  profile                 = var.profile
  shared_credentials_file = "~/.aws/${var.project}/config"
}

provider "aws" {
  alias                   = "secondary_region"
  region                  = var.region_secondary
  profile                 = var.profile
  shared_credentials_file = "~/.aws/${var.project}/config"
}

provider "vault" {
  address     = var.vault_address

  /*
  Vault token that will be used by Terraform to authenticate.
  admin token from https://portal.cloud.hashicorp.com/.
  */
  token       = var.vault_token
}

terraform {
  required_version = ">= 0.14.2"

  required_providers {
    aws = "~> 3.0"
    vault = "~> 2.18.0"
  }

  backend "s3" {
    key = "vault/vault_mounts/terraform.tfstate"
  }
}
