/*
## vault CLI equivalents (https://learn.hashicorp.com/tutorials/vault/getting-started-authentication)
vault auth enable github
vault write auth/github/map/teams/leverage-ref-architecture-aws-dev value=devs
vault write auth/github/map/teams/leverage-ref-architecture-aws-admin value=admins
*/

resource "vault_github_auth_backend" "organization" {
  description  = "github token based credentials"
  organization = "binbashar"
  token_type   = "default"
}

resource "vault_github_team" "ref_architecture_admin" {
  backend  = vault_github_auth_backend.organization.id
  team     = "leverage-ref-architecture-aws-admin"
  policies = ["admins"]
}

resource "vault_github_team" "ref_architecture_dev" {
  backend  = vault_github_auth_backend.organization.id
  team     = "leverage-ref-architecture-aws-dev"
  policies = ["devops"]
}
