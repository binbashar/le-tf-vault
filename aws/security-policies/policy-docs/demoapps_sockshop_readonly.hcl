path "secrets/metadata/le-demo-apps/sock-shop/*" {
    capabilities = ["list", "read"]
}

path "secrets/data/le-demo-apps/sock-shop/*" {
    capabilities = ["read"]
}
