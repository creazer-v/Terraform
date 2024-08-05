terraform {
  backend "remote" {
    hostname     = "cps-terraform.anthem.com"
    organization = "corp"
    workspaces {
      name = "scapp1-prod"
    }
  }
}

variable "APP_ROLE_ID" {}
variable "APP_ROLE_SECRET_ID" {}
variable "ACCOUNT_TYPE" {}
variable "VAULT_NAMESPACE_XYZ" {}

provider "vault" {
  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id   = var.APP_ROLE_ID
      secret_id = var.APP_ROLE_SECRET_ID
    }
  }
}

data "vault_aws_access_credentials" "creds" {
  backend = "${var.VAULT_NAMESPACE_XYZ}/aws/${var.ACCOUNT_TYPE}"
  role    = var.ACCOUNT_TYPE
  type    = "sts"
}

provider "aws" {
  region     = "us-east-1"
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
  token      = data.vault_aws_access_credentials.creds.security_token
}