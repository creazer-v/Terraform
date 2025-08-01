
## 6.8.0 (Unreleased)


FEATURES:

ENHANCEMENTS:

BUG FIXES:

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
