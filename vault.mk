.PHONY: help

NAME = $$(echo $@ | cut -d "-" -f 7- | sed "s/%*$$//")

help:
	@echo 'Quick Instructions:'
	@echo ''
	@echo '  - IMPORTANT: make sure you set the Vault Address as an environment variable like follows:'
	@echo '      export VAULT_ADDR="https://vault-cluster.private.vault.XXXXXX.aws.hashicorp.cloud:8200'
	@echo ''
	@echo '  - IMPORTANT: make sure you are logged in to Vault:'
	@echo '      vault login -method=github '
	@echo ''
	@echo '  - Run `make get-{SERVICE_NAME} to retrieve from Vault the configuration of the given {SERVICE_NAME} as a JSON file`'
	@echo '  - Run `make put-{SERVICE_NAME} to update the configuration of the given {SERVICE_NAME} on Vault`'
	@echo ''

list:
	vault kv list secrets/

# vault kv put secrets/le-tf-infra-aws/apps-devstg/databases-mysql database_admin_password=XXXXXXXXXXXXXXXXXXX
get-le-tf-infra-aws-appsdevstg-%: ## Get Leverage Ref Architecture Terraform apps-devstg account secrets
	vault kv get -format=json secrets/le-tf-infra-aws/apps-devstg/$(NAME) | jq ".data.data" > le-tf-infra-aws-apps-devstg-$(NAME).json

put-le-tf-infra-aws-appsdevstg-%: ## Put Leverage Ref Architecture Terraform apps-devstg account secrets
	cat le-tf-infra-aws-apps-devstg-$(NAME).json | vault kv put secrets/le-tf-infra-aws/apps-devstg/$(NAME) -
