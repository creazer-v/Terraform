# Elevance Health Azure terraform-azurerm-cosmosdb Module

 This module will create an Azure CosmosDB.

## Prerequisites

1. This module is to create an Azure CosmosDB. 
2. Module needs a Service Principal or User with appropriate deployment permissions to run terraform commands.

# Release Notes: #

## New Version - 0.0.1 ##
1. New module to create Azure CosmosDB

### Adoption of the New Version - 0.0.1 ###
1. New module to create Azure CosmosDB

## Usage

1. Provide appropriate details to deploy in the workspace.
terraform {
  backend "remote" {
    hostname     = "cps-terraform.anthem.com"
    organization = "<ORGANIZATION-NAME>"
    workspaces {
      name = "<WORKSPACE-NAME>"
    }
  }
```