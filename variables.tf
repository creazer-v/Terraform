variable "workspace_name" {
  type = string
  description = "Terrform workspace Name"
  default = null
}

variable "workspace_hostname" {
  type = string
  description = "Enter the hostname of the terraform"
  default = "cps-terraform.anthem.com"
}

variable "path-prefix" {
  type = string
  default = "corp-dlvrsermgt/secret/tfe/prod/"
}