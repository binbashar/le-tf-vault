resource "vault_github_auth_backend" "organization" {
  description  = "GitHub Auth Method"
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
  policies = ["devs"]
}
