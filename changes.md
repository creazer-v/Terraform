
## 6.15.0 (Unreleased)


FEATURES:
* **New Data Source:** `aws_odb_db_node` ([#43792](https://github.com/hashicorp/terraform-provider-aws/issues/43792))
* **New Data Source:** `aws_odb_db_nodes` ([#43792](https://github.com/hashicorp/terraform-provider-aws/issues/43792))
* **New Data Source:** `aws_odb_db_server` ([#43792](https://github.com/hashicorp/terraform-provider-aws/issues/43792))
* **New Data Source:** `aws_odb_db_servers` ([#43792](https://github.com/hashicorp/terraform-provider-aws/issues/43792))

ENHANCEMENTS:

BUG FIXES:
* resource/aws_rds_cluster: Fixes error when setting `database_insights_mode` with `global_cluster_identifier`. ([#44404](https://github.com/hashicorp/terraform-provider-aws/issues/44404))

## 6.14.1 (September 22, 2025)


NOTES:

BUG FIXES:

## 6.14.0 (September 18, 2025)


FEATURES:

ENHANCEMENTS:
* resource/aws_rds_global_cluster: Remove provider-side conflict between `source_db_cluster_identifier` and `engine` arguments ([#44252](https://github.com/hashicorp/terraform-provider-aws/issues/44252))

BUG FIXES:

## 6.13.0 (September 11, 2025)


ENHANCEMENTS:
* data-source/aws_dynamodb_table: Add `warm_throughput` and `global_secondary_index.warm_throughput` attributes ([#41308](https://github.com/hashicorp/terraform-provider-aws/issues/41308))
* resource/aws_bedrock_guardrail: Add `input_action`, `output_action`, `input_enabled`, and `output_enabled` arguments to `word_policy_config.managed_word_lists_config` and `word_policy_config.words_config` configuration blocks ([#44224](https://github.com/hashicorp/terraform-provider-aws/issues/44224))
* resource/aws_dynamodb_table: Add `warm_throughput` and `global_secondary_index.warm_throughput` arguments ([#41308](https://github.com/hashicorp/terraform-provider-aws/issues/41308))

BUG FIXES:
* resource/aws_rds_cluster_role_association: Make `feature_name` optional ([#44143](https://github.com/hashicorp/terraform-provider-aws/issues/44143))

## 6.12.0 (September 4, 2025)


NOTES:

FEATURES:

ENHANCEMENTS:

BUG FIXES:

## 6.11.0 (August 28, 2025)


FEATURES:
* **New Resource:** `aws_timestreaminfluxdb_db_cluster` ([#42382](https://github.com/hashicorp/terraform-provider-aws/issues/42382))

ENHANCEMENTS:
* resource/aws_dynamodb_contributor_insights: Add `mode` argument in support of [CloudWatch contributor insights modes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/contributorinsights_HowItWorks.html#contributorinsights_HowItWorks.Modes) ([#43914](https://github.com/hashicorp/terraform-provider-aws/issues/43914))

BUG FIXES:
* resource/aws_db_instance: Fixes the behavior when modifying `database_insights_mode` when using custom KMS key ([#44050](https://github.com/hashicorp/terraform-provider-aws/issues/44050))
* resource/aws_timestreaminfluxdb_db_instance: Fix tag-only update errors ([#42382](https://github.com/hashicorp/terraform-provider-aws/issues/42382))

## 6.10.0 (August 21, 2025)


NOTES:

ENHANCEMENTS:

BUG FIXES:
* resource/aws_rds_cluster: Fixes the behavior when enabling database_insights_mode="advanced" without changing performance insights retention window ([#43919](https://github.com/hashicorp/terraform-provider-aws/issues/43919))
* resource/aws_rds_cluster: Fixes the behavior when modifying `database_insights_mode` when using custom KMS key ([#43942](https://github.com/hashicorp/terraform-provider-aws/issues/43942))

## 6.9.0 (August 14, 2025)


FEATURES:

ENHANCEMENTS:
* resource/aws_dynamodb_table: Add `replica.deletion_protection_enabled` argument ([#43240](https://github.com/hashicorp/terraform-provider-aws/issues/43240))

BUG FIXES:

## 6.8.0 (August 7, 2025)


FEATURES:

ENHANCEMENTS:
* resource/aws_docdb_cluster: Add `serverless_v2_scaling_configuration` argument in support of [Amazon DocumentDB serverless](https://docs.aws.amazon.com/documentdb/latest/developerguide/docdb-serverless.html) ([#43667](https://github.com/hashicorp/terraform-provider-aws/issues/43667))

BUG FIXES:
* resource/aws_timestreaminfluxdb_db_instance: Don't mark `network_type` as [ForceNew](https://developer.hashicorp.com/terraform/plugin/sdkv2/schemas/schema-behaviors#forcenew) if the value is not configured. This fixes a problem with `terraform apply -refresh=false` after upgrade from `v5.90.0` and below ([#43534](https://github.com/hashicorp/terraform-provider-aws/issues/43534))

## 6.7.0 (July 31, 2025)


FEATURES:

ENHANCEMENTS:

BUG FIXES:

## 6.6.0 (July 28, 2025)


FEATURES:

ENHANCEMENTS:

BUG FIXES:

## 6.5.0 (July 24, 2025)


NOTES:

FEATURES:

ENHANCEMENTS:

BUG FIXES:

## 6.4.0 (July 17, 2025)


FEATURES:

ENHANCEMENTS:

BUG FIXES:

## 6.3.0 (July 10, 2025)


FEATURES:

ENHANCEMENTS:
* resource/aws_dynamodb_table: Add `replica.consistency_mode` argument in support of [multi-Region strong consistency](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_HowItWorks.html#V2globaltables_HowItWorks.choosing-consistency-mode) for Amazon DynamoDB global tables ([#43236](https://github.com/hashicorp/terraform-provider-aws/issues/43236))

BUG FIXES:
* resource/aws_db_instance_role_association: Retry `InvalidDBInstanceState` errors on delete ([#43303](https://github.com/hashicorp/terraform-provider-aws/issues/43303))
* resource/aws_rds_cluster_role_association: Retry `InvalidDBClusterStateFault` errors on delete ([#43303](https://github.com/hashicorp/terraform-provider-aws/issues/43303))
* resource/aws_redshift_cluster: Correctly set `availability_zone_relocation_enabled` ([#43270](https://github.com/hashicorp/terraform-provider-aws/issues/43270))

## 6.2.0 (July  2, 2025)


NOTES:

ENHANCEMENTS:

BUG FIXES:

## 6.1.0 (June 26, 2025)


## 6.0.0 (June 18, 2025)

* provider: As the AWS OpsWorks Stacks service has reached [End Of Life](https://docs.aws.amazon.com/opsworks/latest/userguide/stacks-eol-faqs.html), the `aws_opsworks_rds_db_instance` resource has been removed ([#41948](https://github.com/hashicorp/terraform-provider-aws/issues/41948))
* provider: The `aws_redshift_service_account` resource has been removed. AWS [recommends](https://docs.aws.amazon.com/redshift/latest/mgmt/db-auditing.html#db-auditing-bucket-permissions) that a [service principal name](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services) should be used instead of an AWS account ID in any relevant IAM policy ([#41941](https://github.com/hashicorp/terraform-provider-aws/issues/41941))
* resource/aws_db_instance: `character_set_name` now cannot be set with `replicate_source_db`, `restore_to_point_in_time`, `s3_import`, or `snapshot_identifier`. ([#42348](https://github.com/hashicorp/terraform-provider-aws/issues/42348))
* resource/aws_redshift_cluster: Attributes `cluster_public_key`, `cluster_revision_number`, and `endpoint` are now read only and should not be set ([#42119](https://github.com/hashicorp/terraform-provider-aws/issues/42119))
* resource/aws_redshift_cluster: The `logging` attribute has been removed ([#42013](https://github.com/hashicorp/terraform-provider-aws/issues/42013))
* resource/aws_redshift_cluster: The `publicly_accessible` attribute now defaults to `false` ([#41978](https://github.com/hashicorp/terraform-provider-aws/issues/41978))
* resource/aws_redshift_cluster: The `snapshot_copy` attribute has been removed ([#41995](https://github.com/hashicorp/terraform-provider-aws/issues/41995))

NOTES:
* resource/aws_redshift_cluster: The default value of `encrypted` is now `true` to match the AWS API. ([#42631](https://github.com/hashicorp/terraform-provider-aws/issues/42631))

ENHANCEMENTS:

BUG FIXES:
* resource/aws_redshift_cluster: Fixes permanent diff when `encrypted` is not explicitly set to `true`. ([#42631](https://github.com/hashicorp/terraform-provider-aws/issues/42631))
