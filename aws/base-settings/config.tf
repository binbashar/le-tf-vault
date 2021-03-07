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
  address = var.vault_address

  # Refer to this for instructions: https://github.com/binbashar/le-tf-vault/blob/master/config/common.config.example#L18
  token = var.vault_token
}

terraform {
  required_version = ">= 0.14.2"

  required_providers {
    aws   = "~> 3.0"
    vault = "~> 2.18.0"
  }

  backend "s3" {
    key = "aws/base-settings/terraform.tfstate"
  }
}
