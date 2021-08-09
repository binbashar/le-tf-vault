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
  backend = vault_auth_backend.kubernetes.path
  # Get it from your Kubernetes config file:
  #   KUBE_HOST=$(kubectl config view --raw --minify --flatten --output='jsonpath={.clusters[].cluster.server}')
  #
  kubernetes_host = var.kubernetes_auth_host

  # Get it from your Kubernetes config file:
  #   KUBE_CA_CERT=$(kubectl config view --raw --minify --flatten --output='jsonpath={.clusters[].cluster.certificate-authority-data}' | base64 --decode)
  #
  kubernetes_ca_cert = var.kubernetes_auth_ca_cert

  # This is typically the token associated to the Kubernetes Service Account that is
  # created when installing Vault Injector and which has permissions on Kubernetes
  # Token Review API.
  #
  # Get it from your Kubernetes config file:
  #   VAULT_HELM_SECRET_NAME=$(kubectl get secrets -n vault --output=json | jq -r '.items[].metadata | select(.name|startswith("vault-token-")).name')
  #   TOKEN_REVIEW_JWT=$(kubectl get secret -n vault $VAULT_HELM_SECRET_NAME --output='go-template={{ .data.token }}' | base64 --decode)
  #
  token_reviewer_jwt = var.kubernetes_auth_token_reviewer_jwt
}

#
# Map Roles to Policies: EKS DevStg
#
resource "vault_kubernetes_auth_backend_role" "eks_devstg_demoapps_sockshop_readonly" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "demoapps_sockshop_readonly"
  bound_service_account_names      = ["*"]
  bound_service_account_namespaces = ["default", "demo-sock-shop"]
  token_ttl                        = 3600 * 6 # in seconds
  token_policies                   = ["demoapps_sockshop_readonly"]
}
