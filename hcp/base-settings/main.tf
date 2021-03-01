resource "vault_mount" "secrets" {
  path        = "secrets"
  type        = "kv-v2"
  description = "KV2 Secrets Engine for Leverage Developers."
}
