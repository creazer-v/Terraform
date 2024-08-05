#####################################################################################################################################
##			                                          Local Variable Definitions                                                       
#####################################################################################################################################
locals {
  REGION         = data.aws_region.current.name == "us-east-1" ? "awsdns.internal.das" : "us-east-2.awsdns.internal.das"
  region         = data.aws_region.current.name == "us-east-1" ? "primary-us-east-1-plat" : "secondary-us-east-2-plat"
  endpoint       = data.aws_region.current.name == "us-east-1" ? "https://bucket.vpce-0c65760352332dd5a-qahda5nv.s3.us-east-1.vpce.amazonaws.com" : "https://bucket.vpce-0157fc5f0d4d2b003-zy0yy31z.s3.us-east-2.vpce.amazonaws.com"
  aws_region     = data.aws_region.current.name
  tfe_read_token = data.vault_generic_secret.tfe_creds.data.token
}
locals {
  pgsql_postscripts = templatefile("pgsql_postscripts.tpl", {
    region             = local.region
    tfe_read_token     = local.tfe_read_token
    aws_region         = local.aws_region
    TFC_WORKSPACE_NAME = var.TFC_WORKSPACE_NAME
    business-division  = var.business-division
    environment        = var.environment
    result             = module.pgsql.result
    identifier         = module.pgsql.identifier
    result             = module.pgsql.result
    instance_arn       = module.pgsql.instance_arn
    instance_address   = module.pgsql.instance_address
    account_id         = data.aws_caller_identity.current.account_id
  })
}
locals {
  pgsql_vault_cleanup_script = templatefile("pgsql_vault_cleanup_script.tpl", {
    dbinstance  = module.pgsql.instance_address
    environment = var.environment
    region      = local.region
    aws_region  = local.aws_region
  })
}

#####################################################################################################################################
##			                                          Variable Definitions                                                       
#####################################################################################################################################
variable "vpc_id" {
  type    = string
  default = null
}
variable "TFC_WORKSPACE_NAME" {
  type = string
}
variable "create_s3_bucket" {
  default = true
}

#####################################################################################################################################
##			                                          Data Sources                                                                     
#####################################################################################################################################
data "aws_region" "current" {}
data "aws_ami" "antm-golden-dbclients" {
  most_recent = true
  owners      = ["300499308742"]
  filter {
    name   = "name"
    values = ["antm-golden-dbclients-*"]
  }
}
data "aws_security_group" "db_security_group" {
  name = "default"
}
data "aws_vpc" "vpc" {
  id = var.vpc_id
  filter {
    name   = "tag:Name"
    values = ["aws-landing-zone-VPC", "lz-additional-vpc-VPC"]
  }
}
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id == null ? "${data.aws_vpc.vpc.id}" : var.vpc_id]
  }
  tags = {
    Network = "Private"
  }
}
data "aws_route53_zone" "selected" {
  name         = "${data.aws_caller_identity.current.account_id}.${local.REGION}"
  private_zone = true
}
data "aws_caller_identity" "current" {}
data "vault_generic_secret" "tfe_creds" {
  path = "corp-dlvrsermgt/secret/tfe/prod/${lower(var.business-division)}"
}

#####################################################################################################################################
##			                                          PGSQL Database Provisioner                                                         
#####################################################################################################################################
module "pgsql" {
  source  = "cps-terraform.anthem.com/corp/terraform-aws-postgresql/aws"
  version = "0.2.3"

  /* Data Platform Technical Tags */
  application-name       = var.application-name
  bcp-tier               = "Tier-84"
  created-by             = "an700433ad"#module.created-by.name
  database-platform      = "PgSql"
  database-state         = "Active"
  db-patch-schedule      = "M09W4"
  db-patch-time-window   = "Sunday 0100"
  environment            = var.environment
  prepatch-snapshot-flag = "N"
  /* Application Specific Tags */
  application_tag1 = "NULL"
  application_tag2 = "NULL"
  application_tag3 = "NULL"
  application_tag4 = "NULL"
  application_tag5 = "NULL"

  allocated_storage                   = "100"
  apply_immediately                   = false
  availability_zone                   = null
  aws_db_instance_role_association    = true
  backup_window                       = "21:00-00:00"
  ca_cert_identifier                  = "rds-ca-rsa2048-g1"
  dedicated_log_volume                = false
  enabled_cloudwatch_logs_exports     = ["postgresql", "upgrade"]
  engine_version                      = "14.9"
  engine                              = "postgres"
  family                              = "postgres14"
  feature_name                        = "s3Import"
  final_snapshot_identifier           = null
  iam_database_authentication_enabled = false
  identifier                          = "00"
  ingress_rules = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["33.0.0.0/8"]
      description = "Carelon OnPrem"
    },
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["30.0.0.0/8"]
      description = "ElevanceHealth OnPrem"
    },
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.152.0.0/15"]
      description = "ElevanceHealth Governance Team Application Servers in IBM Private Hosting - Ashburn"
    },
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.45.0.0/16"]
      description = "ElevanceHealth vDaaS"
    },
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.112.248.0/22"]
      description = "ElevanceHealth Hashi Vault Infrastructure"
    },
    {
      from_port                = 5432
      to_port                  = 5432
      protocol                 = "tcp"
      source_security_group_id = "${data.aws_security_group.db_security_group.id}"
      description              = "ElevanceHealth PostScripts Automation"
    }
  ]
  instance_class                        = "db.m6g.large"
  iops                                  = "4000"
  kms_key_id                            = lookup(module.kms_service_rds.kms_arn, "rds")
  kms_key_id_log_group                  = lookup(module.kms_service_rds.kms_arn, "logs")
  maintenance_window                    = "Sun:00:00-Sun:03:00"
  max_allocated_storage                 = "150"
  monitoring_interval                   = "5"
  monitoring_role_arn                   = module.iam-enhanced-monitoring-role.iamrole_arn
  multi_az                              = true
  performance_insights_enabled          = true
  performance_insights_retention_period = "7"
  performance_insights_kms_key_id       = lookup(module.kms_service_rds.kms_arn, "rds")
  port                                  = "5432"
  postgresql_parameter_option_group     = "./Postgresql_Parameter_Option_Group.json"
  # restore_to_point_in_time = [{
  #   restore_time                       = ""
  #   source_db_instance_identifier      = ""
  # }]
  role_arn                         = module.iam-enhanced-monitoring-role.iamrole_arn
  retention_in_days_rds_postgresql = 7
  retention_in_days_rds_upgrade    = 7
  serial_number                    = "01"
  # snapshot_identifier                   = ""
  storage_type = "io1"
  tags         = module.mandatory_tags.tags
  vpc_id       = data.aws_vpc.vpc.id
  deletion_protection = false
  skip_final_snapshot = true
  delete_automated_backups = true
}

#####################################################################################################################################
##			                                          CreatedBy Provisioner                                                               
#####################################################################################################################################
# module "created-by" {
#   source = "cps-terraform.anthem.com/corp/terraform-aws-createdby/aws"

#   business-division = var.business-division
# }

#####################################################################################################################################
##			                                          S3 Bucket Provisioner                                                               
#####################################################################################################################################
# module "s3-bucket-rds" {
#   source     = "cps-terraform.anthem.com/corp/terraform-aws-s3/aws"
#   version    = "0.5.1"
#   depends_on = [module.pgsql]

#   aws_kms_key_arn                       = var.create_s3_bucket == false ? "" : module.kms_service_rds.kms_arn["s3"]
#   bucket                                = module.pgsql.s3_name
#   create_aws_s3_lifecycle_configuration = true
#   create_s3_bucket                      = var.create_s3_bucket
#   force_destroy                         = false
#   role                                  = module.iam-enhanced-monitoring-role.iamrole_arn
#   tags                                  = merge(module.mandatory_tags.tags, module.mandatory_data_tags.tags)
# }

#####################################################################################################################################
##			                                          Event Subscription Provisioner                                                               
#####################################################################################################################################
# module "dataplatform_event_subscription_instance" {
#   source  = "cps-terraform.anthem.com/corp/terraform-aws-db-event-subscription/aws"
#   version = "0.0.2"

#   enabled               = true
#   event_categories      = ["availability", "deletion", "failure", "failover", "notification"]
#   name                  = "antmdbes-dataplatform-instance-${var.ATLAS_WORKSPACE_NAME}-${module.pgsql.identifier}"
#   source_ids            = ["${module.pgsql.identifier}"]
#   source_type           = "db-instance"
#   tags                  = module.mandatory_tags.tags
#   delivery_policy       = "./delivery_policy.json"
#   sns_name              = "antmdbes-dataplatform-topic-${var.ATLAS_WORKSPACE_NAME}-${module.pgsql.identifier}"
#   sns_topic_policy_json = templatefile("${path.module}/sns_rds_topic_policy.json", { region = data.aws_region.current.name, account_id = data.aws_caller_identity.current.account_id, rds_monitoring_role = module.iam-enhanced-monitoring-role.iamrole_arn, sns_topic_name = "antmdbes-dataplatform-instance-${var.ATLAS_WORKSPACE_NAME}-${module.pgsql.identifier}" })
#   subscribers = {
#     DD-DL-1 = {
#       protocol               = "email"
#       endpoint               = "event-juhmlmkj@dtdg.co"
#       endpoint_auto_confirms = true
#     },
#     DD-DL-2 = {
#       protocol               = "email"
#       endpoint               = "event-zbtwuuzw@dtdg.co"
#       endpoint_auto_confirms = true
#     },
#   }
# }

#####################################################################################################################################
##			                                          KMS Provisioner                                                               
#####################################################################################################################################
module "kms_service_rds" {
  source  = "cps-terraform.anthem.com/corp/terraform-aws-kms-service/aws"
  version = "0.2.6"

  description    = "KMS for RDS"
  kms_alias_name = "${var.application-name}-${var.environment}"
  service_name   = ["rds", "logs", "s3"]
  tags           = module.mandatory_tags.tags
}

#####################################################################################################################################
##			                                          IAM Role Provisioner                                                               
#####################################################################################################################################
module "iam-enhanced-monitoring-role" {
  source  = "cps-terraform.anthem.com/corp/terraform-aws-iam-role/aws"
  version = "0.1.6"

  assume_role_service_names = ["monitoring.rds.amazonaws.com", "s3.amazonaws.com", "rds.amazonaws.com"]
  force_detach_policies     = true
  iam_role_name             = module.pgsql.iam_role_name
  managed_policy_arns       = ["arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"]
  inline_policy = [{
    name   = "policy-s3-replication"
    policy = templatefile("${path.module}/rds-s3-integration-policy.json", { bucket_name = module.pgsql.s3_name, s3_kms_arn = module.kms_service_rds.kms_arn["s3"] })
  }]
  role_description = "Allow RDS PgSQL to send enhanced monitoring metrics to CloudWatch Logs"
  tags             = module.mandatory_tags.tags
}

#####################################################################################################################################
##			                                          CNAME Record Provisioner                                                               
#####################################################################################################################################
# module "cname-record-rds" {
#   source  = "cps-terraform.anthem.com/corp/terraform-aws-route53-routing-record/aws"
#   version = "0.1.7"

#   hosted_zone_id = data.aws_route53_zone.selected.zone_id
#   record_name    = module.pgsql.identifier
#   set_identifier = "CNAME Record FOR ${module.pgsql.identifier} Instance"
#   records        = ["${module.pgsql.instance_address}"]
#   record_type    = "CNAME"
# }

#####################################################################################################################################
##			                                          Post Scripts Provisioner                                                               
#####################################################################################################################################
# module "terraform-aws-ec2" {
#   depends_on = [module.pgsql]
#   source     = "cps-terraform.anthem.com/corp/terraform-aws-ec2/aws"
#   version    = "0.4.5"

#   delete_on_termination                = true
#   disable_api_termination              = false
#   iam_instance_profile                 = "CMDBLambdaRole"
#   instance_ami                         = data.aws_ami.antm-golden-dbclients.id
#   instance_initiated_shutdown_behavior = "terminate"
#   instance_name                        = "${module.mandatory_tags.tags["application-name"]}-${module.mandatory_tags.tags["environment"]}-${module.mandatory_tags.tags["business-division"]}"
#   kms_key_id                           = module.kms_service_ec2.kms_arn["ec2"]
#   number_of_instances                  = 1
#   root_volume_size                     = "120"
#   subnet_ids                           = data.aws_subnets.private.ids
#   tags                                 = module.mandatory_tags.tags
#   vpc_security_group_ids               = [data.aws_security_group.db_security_group.id]
#   user_data                            = local.pgsql_postscripts
# }
# module "kms_service_ec2" {
#   source  = "cps-terraform.anthem.com/corp/terraform-aws-kms-service/aws"
#   version = "0.2.6"

#   description    = "KMS for EC2"
#   kms_alias_name = "${var.application-name}-${var.environment}"
#   service_name   = ["ec2"]
#   tags           = module.mandatory_tags.tags
# }

#####################################################################################################################################
##			                                          Vault Backend Connection Provisioner                                                              
#####################################################################################################################################
# module "terraform-aws-db-vault-backend-connection" {
#   source     = "cps-terraform.anthem.com/corp/terraform-aws-db-vault-backend-connection/aws"
#   version    = "0.0.4"
#   depends_on = [module.terraform-aws-ec2]

#   db_name     = module.pgsql.instance_name
#   endpoint    = module.pgsql.instance_address
#   engine      = "postgres"
#   environment = var.environment
#   port        = 5432
#   region      = data.aws_region.current.name
# }

#####################################################################################################################################
##			                                          Vault Cleanup Provisioner                                                               
#####################################################################################################################################
#module "terraform-aws-ec2-vault-cleaner" {
#  source = "cps-terraform.anthem.com/CORP/terraform-aws-ec2/aws"

#  delete_on_termination                = true
#  disable_api_termination              = false
#  iam_instance_profile                 = "CMDBLambdaRole"
#  instance_ami                         = data.aws_ami.antm-golden-dbclients.id
#  instance_name                        = "${module.mandatory_tags.tags["application-name"]}-${module.mandatory_tags.tags["environment"]}-${module.mandatory_tags.tags["business-division"]}-cleaner"
#  instance_initiated_shutdown_behavior = "terminate"
#  kms_key_id                           = module.kms_service_ec2.kms_arn["ec2"]
#  number_of_instances                  = 1
#  root_volume_size                     = "120"
#  subnet_ids                           = data.aws_subnets.private.ids
#  tags                                 = module.mandatory_tags.tags
#  vpc_security_group_ids               = [data.aws_security_group.db_security_group.id]
#  user_data                            = local.pgsql_vault_cleanup_script
#}

#####################################################################################################################################
##			                                          Secrets Manager Provisioner                                                              
#####################################################################################################################################

# module "database_proxy_secretsmanager" {
#   source = "cps-terraform.anthem.com/corp/terraform-aws-secretsmgr/aws"
#   version    = "<Provide The Latest Version>"

#   create_secret_rotation  = false
#   description             = "Secrets manager for DB Postgres"
#   kms_key_id              = module.kms_service_secretmanager.kms_arn["secretsmanager"]
#   name                    = "${var.environment}/aurora-mysql/${module.pgsql.instance_address}"
#   recovery_window_in_days = "0"
#   secret_string = jsonencode({
#     "username" : "<username>",
#     "password" : "<password>"
#   })
#   tags = module.mandatory_tags.tags
#   version_stages = ["AWSCURRENT"]
# }

# module "kms_service_secretmanager" {
#   source  = "cps-terraform.anthem.com/corp/terraform-aws-kms-service/aws"
#   version    = "<Provide The Latest Version>"

#   description    = "KMS Keys for Secrets Manager"
#   kms_alias_name = "${var.application-name}-${var.environment}-secrets-manager"
#   service_name   = ["secretsmanager"]
#   tags           = module.mandatory_tags.tags
#   multi_region   = true
# }
