variable "business-division" {
  type        = string
  description = "The business division that is creating the resources"
  default = "corp"
  
}

#####################################################################################################################################
##			                                          CreatedBy Provisioner                                                               
#####################################################################################################################################
module "created-by" {
  source = "cps-terraform.anthem.com/corp/terraform-aws-createdby/aws"

  business-division = var.business-division
}

output "name" {
value = module.created-by.username
}
