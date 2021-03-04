resource "vault_mount" "secrets" {
  type        = "kv-v2"
  path        = "secrets"
  description = "KV Secrets Engine - Version 2"
}

resource "vault_audit" "default" {
  type = "file"
  options = {
    file_path = "/var/log/vault/audit.log"
  }
}
