#
# Highly sensitive secrets are retrieved from Vault
#
data "vault_generic_secret" "eks_devstg" {
  path = "secrets/le-tf-vault/hcp/security-kubernetes"
}

#
# Enable Kubernetes Authentication
#
resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

#
# Configure Kubernetes Authentication: EKS DevStg
#
resource "vault_kubernetes_auth_backend_config" "eks_devstg" {
  backend            = vault_auth_backend.kubernetes.path
  # NOTE: replace this with your own Kubernetes host
  kubernetes_host    = "https://ABCDEFGHIJK1234567890.gr7.us-east-1.eks.amazonaws.com"
  # NOTE: replace this with the CA certificate that belongs to your Kubernetes
  kubernetes_ca_cert = <<EOT
-----BEGIN CERTIFICATE-----
MIICyDCCAbCgAwIBAgIBADANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDEwprdWJl
cm5ldGVzMB4XDTIxMDMxMTExMTIyNVoXDTMxMDMwOTExMTIyNVowFTETMBEGA1UE
AxMKa3ViZXJuZXRlczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMzk
4ee+XJqofktLErt9tu2QGOefHBL+uAsHE53u0B7Y8KBEXtDn9DIOUUQ/p1bb/gvi
Bfk2I3WMT8uE9AIv7PMhz6M5gvvaXQp57bDDfWCX+XaLs4CVPehWGVHXc6szcDuv
oNhp7LeVF+VoITf/dI+BMQC2FjIKMFS0JsEsnew255Opopb3fwwueN6TRhJ/M4Wu
uoieqpCEqtq47niNVw8DpiwDMGTeU40GfHgL/L7M2qgFd+uSRyM7FmnkNarquvDD
cm5ldGVzMB4XDTIxMDMxMTExMTIyNVoXDTMxMDMwOTExMTIyNVowFTETMBEGA1UE
AxMKa3ViZXJuZXRlczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMzk
4ee+XJqofktLErt9tu2QGOefHBL+uAsHE53u0B7Y8KBEXtDn9DIOUUQ/p1bb/gvi
Bfk2I3WMT8uE9AIv7PMhz6M5gvvaXQp57bDDfWCX+XaLs4CVPehWGVHXc6szcDuv
oNhp7LeVF+VoITf/dI+BMQC2FjIKMFS0JsEsnew255Opopb3fwwueN6TRhJ/M4Wu
uoieqpCEqtq47niNVw8DpiwDMGTeU40GfHgL/L7M2qgFd+uSRyM7FmnkNarquvDD
soB4PQ7/haN+v7wYUp1KzY0/z7frW+AKlfIIFGUBN6kXHr7pxLNaDidoH9dkYxJy
U2H1udLB+mzLjk8ma7wwe3N5gqiQXJkuVandO4aRjX+CH7AFKc/j+Do/fCQ=
-----END CERTIFICATE-----
EOT

  # This is typically the token associated to the Kubernetes Service Account that is
  # created when installing Vault Injector and which has permissions on Kubernetes
  # Token Review API
  token_reviewer_jwt = data.vault_generic_secret.eks_devstg.data["token_reviewer_jwt"]
}

#
# Map Roles to Policies: EKS DevStg
#
resource "vault_kubernetes_auth_backend_role" "eks_devstg_demoapps_sockshop_readonly" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "demoapps_sockshop_readonly"
  bound_service_account_names      = ["*"]
  bound_service_account_namespaces = ["default", "sock-shop"]
  token_ttl                        = 3600 * 6  # in seconds
  token_policies                   = ["demoapps_sockshop_readonly"]
}
