#
# config/backend.config
#
#================================#
# Terraform AWS Backend Settings #
#================================#
variable "region" {
  type        = string
  description = "AWS Region"
}

variable "profile" {
  type        = string
  description = "AWS Profile (required by the backend but also used for other resources)"
}

variable "bucket" {
  type        = string
  description = "AWS S3 TF State Backend Bucket"
}

variable "dynamodb_table" {
  type        = string
  description = "AWS DynamoDB TF Lock state table name"
}

variable "encrypt" {
  type        = bool
  description = "Enable AWS DynamoDB with server side encryption"
}

#
# config/account.config
#
#=============================#
# Project Variables           #
#=============================#
variable "environment" {
  type        = string
  description = "Environment Name"
}

#
# config/common.config
#
#=============================#
# Accounts & Extra Vars       #
#=============================#
variable "project" {
  type        = string
  description = "Project Name"
}

variable "project_long" {
  type        = string
  description = "Project Long Name"
}


variable "region_secondary" {
  type        = string
  description = "AWS Scondary Region for HA"
}

variable "shared_account_id" {
  type        = string
  description = "Account: Shared Resources"
}

variable "vault_address" {
  type        = string
  description = "Hashicorp vault api endpoint address"
}

variable "vault_token" {
  type        = string
  description = "Hashicorp vault admin token"
}

#=============================#
# Kubernetes Auth Config      #
#=============================#
variable "kubernetes_auth_host" {
  type        = string
  description = "Kubernetes host"
}

variable "kubernetes_auth_ca_cert" {
  type        = string
  description = "Kubernetes CA certificate"
}

variable "kubernetes_auth_token_reviewer_jwt" {
  type        = string
  description = "Kubernetes Token Reviewer API JWT"
}
