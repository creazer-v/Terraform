module "mandatory_tags" {
  source  = "cps-terraform.anthem.com/corp/terraform-aws-mandatory-tags-v2/aws"
  version = "0.0.2"

  tags = {
    "ci-owner"  = var.ci-owner
    "app-env"   = var.app-env
    "infra-env" = var.infra-env
  }
  apm-id               = var.apm-id
  application-name     = var.application-name
  app-support-dl       = var.app-support-dl
  app-servicenow-group = var.app-servicenow-group
  business-division    = var.business-division
  compliance           = var.compliance
  company              = var.company
  costcenter           = var.costcenter
  environment          = var.environment
  PatchGroup           = var.PatchGroup
  PatchWindow          = var.PatchWindow
  workspace            = var.ATLAS_WORKSPACE_NAME

  elvh-apm-id               = var.elvh-apm-id
  elvh-app-env              = var.elvh-app-env
  elvh-application-name     = var.elvh-application-name
  elvh-app-support-dl       = var.elvh-app-support-dl
  elvh-app-servicenow-group = var.elvh-app-servicenow-group
  elvh-business-division    = var.elvh-business-division
  elvh-ci-owner             = var.elvh-ci-owner
  elvh-company              = var.elvh-company
  elvh-costcenter           = var.elvh-costcenter
  elvh-infra-env            = var.elvh-infra-env
  elvh-workspace            = var.ATLAS_WORKSPACE_NAME
}

module "mandatory_data_tags" {
  source                    = "cps-terraform.anthem.com/corp/terraform-aws-mandatory-data-tags-v2/aws"
  tags                      = {}
  financial-internal-data   = var.financial-internal-data
  financial-regulatory-data = var.financial-regulatory-data
  legal-data                = var.legal-data
  privacy-data              = var.privacy-data
}

/***** Workspace variables ****/
variable "app-servicenow-group" {}
variable "company" {}
variable "compliance" {}
variable "costcenter" {}
variable "environment" {}
variable "apm-id" {}
variable "application-name" {}
variable "app-support-dl" {}
variable "business-division" {}
variable "PatchGroup" {}
variable "PatchWindow" {}
variable "ATLAS_WORKSPACE_NAME" {}
variable "ci-owner" {}
variable "app-env" {}
variable "infra-env" {}

variable "elvh-apm-id" {}
variable "elvh-app-env" {}
variable "elvh-application-name" {}
variable "elvh-app-support-dl" {}
variable "elvh-app-servicenow-group" {}
variable "elvh-business-division" {}
variable "elvh-ci-owner" {}
variable "elvh-company" {}
variable "elvh-costcenter" {}
variable "elvh-infra-env" {}
