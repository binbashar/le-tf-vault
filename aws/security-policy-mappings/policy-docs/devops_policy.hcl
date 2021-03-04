path "secrets/*"
{
  capabilities = ["list"]
}

path "secrets/le-tf-infra-aws"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "secrets/le-ansible-infra"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "secrets/le-helm-infra"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "secrets/le-tf-vault"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}
