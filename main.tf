variable "business-division" {
  type        = string
  description = "The business division that is creating the resources"
  default = "corp"
  
}

#####################################################################################################################################
##			                                          CreatedBy Provisioner                                                               
#####################################################################################################################################
#####################################################################################################################################
##			                                         Get_Created_By Provisioner                                                          
#####################################################################################################################################
locals {
  workspace_name = var.workspace_name == null ? terraform.workspace : var.workspace_name
  tfe_read_token = data.vault_generic_secret.tfe_creds.data.token
  hostname       = var.workspace_hostname
  headers = {
    Authorization = "Bearer ${local.tfe_read_token}"
    Content-Type  = "application/vnd.api+json"
  }
  run_details  = jsondecode(data.http.workspaces_details.response_body)["data"]["relationships"]["latest-run"]["data"]["id"]
  user_details = try(jsondecode(data.http.run_details.response_body)["data"]["relationships"]["created-by"]["data"]["id"],jsondecode(data.http.run_details.response_body)["data"]["relationships"]["confirmed-by"]["data"]["id"], "Automated")
  username     = try(jsondecode(data.http.user_details.response_body)["data"]["attributes"]["username"], jsondecode(data.http.ingress_attributes.body).data.attributes["sender-username"], "Automated")
}

# Read Token
data "vault_generic_secret" "tfe_creds" {
  path = "${var.path-prefix}${lower(var.business-division)}"
}

# Get Run ID info from Workspace
data "http" "workspaces_details" {
  url             = "https://${local.hostname}/api/v2/organizations/${lower(var.business-division)}/workspaces/${local.workspace_name}"
  request_headers = local.headers
}
data "http" "configuration_version" {
  url = "https://${local.hostname}${jsondecode(data.http.run_details.body).data.relationships.configuration-version.links.related}"
 
  request_headers = local.headers
}
# Fetch ingress attributes using the configuration version ID
data "http" "ingress_attributes" {
  url             = "https://${local.hostname}${jsondecode(data.http.configuration_version.body).data.relationships.ingress-attributes.links.related}"
  request_headers = local.headers
}
# Get User ID info from the specific Run Details 
data "http" "run_details" {
  url             = "https://${local.hostname}/api/v2/runs/${local.run_details}?include=configuration-version"
  request_headers = local.headers
}
# Get Username info from User Details
data "http" "user_details" {
  url             = "https://${local.hostname}/api/v2/users/${local.user_details}"
  request_headers = local.headers
}