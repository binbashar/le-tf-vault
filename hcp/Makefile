.PHONY: help

NAME = $$(echo $@ | cut -d "-" -f 4- | sed "s/%*$$//")

help:
	@echo 'Quick Instructions:'
	@echo ''
	@echo '  - IMPORTANT: make sure you set the Vault Address and Namespace'
	@echo '  (if needed) as environment variables like follows:'
	@echo '      export VAULT_ADDR="https://vault-cluster.private.vault.XXXXXX.aws.hashicorp.cloud:8200"'
	@echo '      export VAULT_NAMESPACE="admin"'
	@echo ''
	@echo '  - IMPORTANT: make sure you are logged in to Vault:'
	@echo '      vault login -method=github '
	@echo '  And export the Vault token returned: '
	@echo '      export VAULT_TOKEN="s.XXXXXXXXXXXXXXXXXXXXXXXXXXXX.hbtct" '
	@echo ''
	@echo '  - Run `make get-{SERVICE_NAME} to retrieve from Vault the configuration of the given {SERVICE_NAME} as a JSON file`'
	@echo '    eg: `make get-bb-appsdevstg-databases-mysql`'
	@echo ''
	@echo '  - Run `make put-{SERVICE_NAME} to update the configuration of the given {SERVICE_NAME} on Vault`'
	@echo '    eg: `make put-bb-appsdevstg-databases-mysql`'
	@echo ''
	@echo ''
	@echo 'Available Commands:'
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'
	@egrep '^[a-zA-Z_-]+%:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":"}; { if ($$3 == "") { printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2 } else { printf " - \033[36m%-18s\033[0m %s\n", $$2, $$3 }}'

list: ## list vault key value stores under /secrets
	vault kv list /secrets/bb

list-shared: ## list vault key value stores for /bb/shared account
	vault kv list /secrets/bb/shared

list-appsdevstg: ## list vault key value stores for /bb/appsdevstg account
	vault kv list /secrets/bb/apps-devstg

get-bb-shared-%: ## Get /bb/shared account secrets (vault kv get /secrets/bb/shared/notifications)
	vault kv get -format=json /secrets/bb/shared/$(NAME) | jq ".data.data" > bb-shared-$(NAME).json

put-bb-shared-%: ## Put /bb/shared account secrets (vault kv put /secrets/bb/shared/notifications slack_webhook_monitoring=XXXXXXXXXXXXX)
	cat bb-shared-$(NAME).json | vault kv put /secrets/bb/shared/$(NAME) -

get-bb-appsdevstg-%: ## Get /bb/apps-devstg account secrets (vault kv put secrets/bb/apps-devstg/databases-mysql database_admin_password=XXXXXXXXXX)
	vault kv get -format=json /secrets/bb/apps-devstg/$(NAME) | jq ".data.data" > bb-apps-devstg-$(NAME).json

put-bb-appsdevstg-%: ## Put Leverage Ref Architecture Terraform apps-devstg account secrets
	cat bb-apps-devstg-$(NAME).json | vault kv put /secrets/bb/apps-devstg/$(NAME) -
