resource "vault_policy" "admins" {
  name   = "admins"
  policy = file("policy-docs/admins_policy.hcl")
}

resource "vault_policy" "devops" {
  name   = "devops"
  policy = file("policy-docs/devops_policy.hcl")
}

resource "vault_policy" "devs" {
  name   = "devs"
  policy = file("policy-docs/devs_policy.hcl")
}

resource "vault_policy" "demoapps_sockshop_readonly" {
  name   = "demoapps_sockshop_readonly"
  policy = file("policy-docs/demoapps_sockshop_readonly.hcl")
}
