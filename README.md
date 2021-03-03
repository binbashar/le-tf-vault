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
