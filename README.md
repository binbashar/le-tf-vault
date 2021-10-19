<div align="center">
    <img src="./%40doc/figures/binbash.png"
    alt="binbash" width="250"/>
</div>
<div align="right">
  <img src="./%40doc/figures/binbash-leverage-terraform.png"
  alt="leverage" width="130"/>
</div>

# Leverage Reference Architecture: Terraform Vault

## Overview
This repository contains all Terraform configuration files used to create Binbash Leverage Reference Vault
Solutions Architecture.

## Documentation
Check out the [Binbash Leverage Reference Architecture Official Documentation](https://leverage.binbash.com.ar).


## Leverage setting
In order to set Leverage CLI and Vault set the `config/common.config` file as fallows:

```
# Project (short name)
project         = "bb"

# Project (long name)
project_long    = "binbash"

# AWS Region for DR replicatin (required by the backend but also used for other resources)
region_secondary      = "us-east-2"

# Account IDs
shared_account_id     = "123456789101"

# Hashicorp Vault private API endpoint
#
# If you are on HCP, you can get this from the Admin UI. Otherwise, it will
# depend on how you set up DNS, TLS and port settings for your self-hosted
# installation.
vault_address = "https://bb-le-shared-vault-cluster.private.vault.XXXXXX.aws.hashicorp.cloud:8200"

# Hashicorp Vault token
#
# Vault token that will be used by Terraform to perform calls to Vault API.
# During the initial setup, you will have to use a root token. If you are
# using a self-hosted installation you will get such token after you initialize
# Vault; if you are using Hashicorp Cloud Platform you can get the token from
# HCP Admin UI.
# After the initial setup, and since we integrate Vault to Github for
# authentication, you will have to follow these steps:
#   1- Generate a GitHub Personal Access Token: https://github.com/settings/tokens
#   2- Click “Generate new token“
#   3- Under scopes, only select "read:org", under "admin:org"
#   4- Log in to Vault: vault login -method=github
#   5- Input the Personal Access Token from the previous step
#   6- The output should display a Vault token you can use here
#
#vault_token = "s.XXXXXXXXXXXXXXXXXXXXXX.Apshc"
```

**NOTE:** Set `project` and `project_long` and `shared_account_id` variables according to your needs. Also take into account you will need to log in to Vault to generate the the `vault_token` needed in the `config/common.config` file.

### Ref Links

#### Vault Terraform Provider
- https://registry.terraform.io/providers/hashicorp/vault/latest/docs
- https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/github_team
- https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy

#### Vault Docs
- https://www.vaultproject.io/docs/secrets/kv
- https://www.vaultproject.io/docs/configuration/ui

#### Vault Tutorials
- https://learn.hashicorp.com/tutorials/vault/getting-started-ui
- https://learn.hashicorp.com/tutorials/vault/getting-started-intro-ui

#### Useful commands

```
$ vault secrets list -detailed
$ vault kv list secrets/

$ vault kv put secrets/foo bar=baz
Success! Data written to: secrets/foo

$ vault kv list secrets/
Keys
----
foo

$ vault kv get secrets/foo
=== Data ===
Key    Value
---    -----
bar    baz
Vault UI
```

---
# Release Management
### CircleCi PR auto-release job

<div align="left">
  <img src="./%40doc/figures/circleci.png" alt="circleci" width="130"/>
</div>

- [**pipeline-job**](https://app.circleci.com/pipelines/github/binbashar/le-tf-vault) (**NOTE:** Will only run after merged PR)
- [**releases**](https://github.com/binbashar/le-tf-vault/releases)
- [**changelog**](https://github.com/binbashar/le-tf-vault/blob/master/CHANGELOG.md)
