FEATURES:
ENHANCEMENTS:
* data-source/aws_rds_certificate: Add `default_for_new_launches` attribute ([#40536](https://github.com/hashicorp/terraform-provider-aws/issues/40536))
* data-source/aws_rds_engine_version: Add `supports_certificate_rotation_without_restart`, `supports_integrations`, and `supports_local_write_forwarding` attributes ([#40700](https://github.com/hashicorp/terraform-provider-aws/issues/40700))
BUG FIXES:
* resource/aws_rds_instance Fix `manage_master_user_password` being updated in state when update errors ([#40538](https://github.com/hashicorp/terraform-provider-aws/issues/40538))
BUG FIXES:
ENHANCEMENTS:
BUG FIXES:
FEATURES:
* **New Resource:** `aws_rds_cluster_snapshot_copy` ([#40398](https://github.com/hashicorp/terraform-provider-aws/issues/40398))
ENHANCEMENTS:
* resource/aws_db_parameter_group: Support import of `name_prefix` argument ([#40622](https://github.com/hashicorp/terraform-provider-aws/issues/40622))
BUG FIXES:
* resource/aws_rds_cluster: Fix issue with waiter when modifying `allocated_storage` ([#40601](https://github.com/hashicorp/terraform-provider-aws/issues/40601))
FEATURES:
ENHANCEMENTS:
* resource/aws_rds_cluster: Add `serverlessv2_scaling_configuration.seconds_until_auto_pause` argument ([#40441](https://github.com/hashicorp/terraform-provider-aws/issues/40441))
* resource/aws_rds_global_cluster: Add `tags` argument and `tags_all` attribute ([#40470](https://github.com/hashicorp/terraform-provider-aws/issues/40470))
BUG FIXES:
* data-source/aws_kinesis_stream: Fix `InvalidArgumentException: NextToken and StreamName cannot be provided together` errors when the data stream has more than 1000 shards ([#40499](https://github.com/hashicorp/terraform-provider-aws/issues/40499))
* resource/aws_rds_cluster: Fix `InvalidDBClusterStateFault` errors when deleting clusters that are members of a global cluster ([#40333](https://github.com/hashicorp/terraform-provider-aws/issues/40333))
* resource/aws_rds_cluster: Fix `InvalidParameterValue: Serverless v2 maximum capacity 0.0 isn't valid. The maximum capacity must be at least 1.0.` errors when removing `serverlessv2_scaling_configuration` in an update ([#40511](https://github.com/hashicorp/terraform-provider-aws/issues/40511))
* resource/aws_rds_cluster: Respect `storage_type` when restoring from S3 ([#40471](https://github.com/hashicorp/terraform-provider-aws/issues/40471))
* resource/aws_rds_cluster: Respect `storage_type` when restoring from snapshot ([#40471](https://github.com/hashicorp/terraform-provider-aws/issues/40471))
* resource/aws_rds_cluster: Respect `storage_type` when restoring to a point in time ([#40471](https://github.com/hashicorp/terraform-provider-aws/issues/40471))
* resource/aws_rds_global_cluster: Mark `database_name` as Computed. This prevents resource recreation when the source cluster specifies a `database_name` ([#40469](https://github.com/hashicorp/terraform-provider-aws/issues/40469))
FEATURES:
ENHANCEMENTS:
* resource/aws_dynamodb_table_replica: Add `deletion_protection_enabled` argument ([#35359](https://github.com/hashicorp/terraform-provider-aws/issues/35359))
* resource/aws_rds_cluster: Adjust `serverlessv2_scaling_configuration.max_capacity` and `serverlessv2_scaling_configuration.min_capacity` minimum values to `0` to support Amazon Aurora Serverless v2 scaling to 0 ACUs ([#40230](https://github.com/hashicorp/terraform-provider-aws/issues/40230))
BUG FIXES:
* resource/aws_rds_cluster_instance: Fix error when destroying from a read replica cluster ([#40409](https://github.com/hashicorp/terraform-provider-aws/issues/40409))
FEATURES:
ENHANCEMENTS:
* resource/aws_rds_cluster: Add ability to promote read replica cluster to standalone ([#40337](https://github.com/hashicorp/terraform-provider-aws/issues/40337))
BUG FIXES:
FEATURES:
* **New Resource:** `aws_iam_organizations_features` ([#40164](https://github.com/hashicorp/terraform-provider-aws/issues/40164))
ENHANCEMENTS:
BUG FIXES:
* data-source/aws_rds_reserved_instance_offering: When `product_description` (e.g., "postgresql") is a substring of multiple products, fix `Error: multiple RDS Reserved Instance Offerings matched; use additional constraints to reduce matches to a single RDS Reserved Instance Offering` ([#40281](https://github.com/hashicorp/terraform-provider-aws/issues/40281))
* resource/aws_db_instance: When changing `storage_type` from `io1` or `io2` to `gp3`, fix bug causing error `InvalidParameterCombination: You must specify both the storage size and iops when modifying the storage size or iops on a DB instance that has iops` ([#37257](https://github.com/hashicorp/terraform-provider-aws/issues/37257))
* resource/aws_db_instance: When changing a `gp3` volume's `allocated_storage` to a value larger than the [threshold value for `engine`](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#gp3-storage), fix bug causing error `InvalidParameterCombination: You must specify both the storage size and iops when modifying the storage size or iops on a DB instance that has iops` ([#28847](https://github.com/hashicorp/terraform-provider-aws/issues/28847))
FEATURES:
* **New Resource:** `aws_rds_instance_state` ([#40180](https://github.com/hashicorp/terraform-provider-aws/issues/40180))
ENHANCEMENTS:
* resource/aws_rds_global_cluster: Add `endpoint` argument to point to the writer DB instance in the current primary cluster ([#39960](https://github.com/hashicorp/terraform-provider-aws/issues/39960))
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
ENHANCEMENTS:
BUG FIXES:
* resource/aws_dynamodb_table: Allow table TTL to be disabled by allowing `ttl[0].attribute_name` to be set when `ttl[0].enabled` is false ([#40046](https://github.com/hashicorp/terraform-provider-aws/issues/40046))
FEATURES:
ENHANCEMENTS:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
* resource/aws_docdb_cluster: Use `master_password` on resource Create when `snapshot_identifier` is configured ([#38193](https://github.com/hashicorp/terraform-provider-aws/issues/38193))
FEATURES:
ENHANCEMENTS:
* resource/aws_dynamodb_kinesis_streaming_destination: Add `approximate_creation_date_time_precision` argument ([#38098](https://github.com/hashicorp/terraform-provider-aws/issues/38098))
* resource/aws_sagemaker_feature_group: Add `feature_definition.collection_config`, `feature_definition.collection_type`, and `throughput_config` arguments ([#39805](https://github.com/hashicorp/terraform-provider-aws/issues/39805))
BUG FIXES:
* resource/aws_dynamodb_table: Fix validation error when optional attribute in `on_demand_throughput` is excluded ([#39784](https://github.com/hashicorp/terraform-provider-aws/issues/39784))
* resource/aws_route53_record: Allow creation of records with `ttl=0` ([#39728](https://github.com/hashicorp/terraform-provider-aws/issues/39728))
FEATURES:
ENHANCEMENTS:
BUG FIXES:
* resource/aws_dynamodb_table: Fix crash when `billing_mode` is set to `PAY_PER_REQUEST` without `global_secondary_index` updates ([#39752](https://github.com/hashicorp/terraform-provider-aws/issues/39752))
* resource/aws_dynamodb_table_replica: Properly handles default and ignored tags. ([#39734](https://github.com/hashicorp/terraform-provider-aws/issues/39734))
* This version contains all the features, enhancements, and bug fixes from the [v5.71.0 release](https://github.com/hashicorp/terraform-provider-aws/blob/main/CHANGELOG.md#5710-october-11-2024) which was removed from the Terraform Registry ([#39692](https://github.com/hashicorp/terraform-provider-aws/issues/39692))
FEATURES:
ENHANCEMENTS:
* resource/aws_dynamodb_table: Add `on_demand_throughput` and `global_secondary_index.on_demand_throughput` arguments ([#37799](https://github.com/hashicorp/terraform-provider-aws/issues/37799))
* resource/aws_rds_cluster: Increase maximum value of `serverlessv2_scaling_configuration.max_capacity` and `serverlessv2_scaling_configuration.min_capacity` from `128` to `256` ([#39697](https://github.com/hashicorp/terraform-provider-aws/issues/39697))
* resource/aws_rds_cluster_instance: Treat `storage-optimization` status as success when creating or updating cluster DB instances ([#39691](https://github.com/hashicorp/terraform-provider-aws/issues/39691))
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
* resource/aws_simpledb_domain: The `aws_simpledb_domain` resource has been deprecated and will be removed in a future version. Use Amazon DynamoDB instead ([#39536](https://github.com/hashicorp/terraform-provider-aws/issues/39536))
FEATURES:
* **New Resource:** `aws_securityhub_standards_control_association` ([#39511](https://github.com/hashicorp/terraform-provider-aws/issues/39511))
ENHANCEMENTS:
BUG FIXES:
* provider: This release contains an upstream AWS SDK for Go v2 [change](https://github.com/aws/aws-sdk-go-v2/issues/2807) to DynamoDB service endpoints. The Terraform AWS Provider will now connect to a DynamoDB endpoint in the format [`(account-id).ddb.(region).amazonaws.com`](https://docs.aws.amazon.com/sdkref/latest/guide/feature-account-endpoints.html) instead of `dynamodb.(region).amazonaws.com`. If your network configuration blocks outgoing traffic to DynamoDB based on DNS names or endpoint URLs, you must adjust your configuration, because the service's DNS name will change. You may instead disable account-based endpoints for DynamoDB by setting `account_id_endpoint_mode = disabled` in a [shared config file](https://docs.aws.amazon.com/sdkref/latest/guide/settings-reference.html#ConfigFileSettings) or setting the `AWS_ACCOUNT_ID_ENDPOINT_MODE` [environment variable](https://docs.aws.amazon.com/sdkref/latest/guide/settings-reference.html#EVarSettings) to `disabled` ([#39505](https://github.com/hashicorp/terraform-provider-aws/issues/39505))
ENHANCEMENTS:
BUG FIXES:
* resource/aws_db_instance: Allow replica database to be added to domain on create ([#39448](https://github.com/hashicorp/terraform-provider-aws/issues/39448))
* resource/aws_db_instance_role_association: Fix intermittent failure when instance is not in an available state ([#39457](https://github.com/hashicorp/terraform-provider-aws/issues/39457))
* resource/aws_dynamodb_tag: Fix propagation timeout when multiple tags exist ([#39491](https://github.com/hashicorp/terraform-provider-aws/issues/39491))
* resource/aws_rds_cluster_role_association: Fix intermittent failure when cluster is not in an available state ([#39457](https://github.com/hashicorp/terraform-provider-aws/issues/39457))
FEATURES:
* **New Data Source:** `aws_securityhub_standards_control_associations` ([#39334](https://github.com/hashicorp/terraform-provider-aws/issues/39334))
ENHANCEMENTS:
BUG FIXES:
* resource/aws_dynamodb_table: Fix changing replicas to the default `Managed by DynamoDB` encryption setting ([#31284](https://github.com/hashicorp/terraform-provider-aws/issues/31284))
* resource/aws_dynamodb_table: Handle eventual consistency of tag creation and removal ([#39326](https://github.com/hashicorp/terraform-provider-aws/issues/39326))
* resource/aws_dynamodb_table_replica: Handle eventual consistency of tag creation and removal ([#39326](https://github.com/hashicorp/terraform-provider-aws/issues/39326))
* resource/aws_dynamodb_tag: Handle eventual consistency of tag creation and removal ([#39326](https://github.com/hashicorp/terraform-provider-aws/issues/39326))
FEATURES:
ENHANCEMENTS:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
* resource/aws_docdbelastic_cluster: Add `backup_retention_period` and `preferred_backup_window` attributes ([#38452](https://github.com/hashicorp/terraform-provider-aws/issues/38452))
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
ENHANCEMENTS:
* resource/aws_dynamodb_table: Add `restore_source_table_arn` attribute ([#38953](https://github.com/hashicorp/terraform-provider-aws/issues/38953))
BUG FIXES:
* resource/aws_rds_cluster: Allow Web Service Data API (`enabled_http_endpoint`) to be enabled and disabled for `provisioned` engine mode and serverlessv2 ([#38997](https://github.com/hashicorp/terraform-provider-aws/issues/38997))
FEATURES:
ENHANCEMENTS:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
* resource/aws_db_event_subscription: Fix plan-time validation of `name` and `name_prefix` ([#38194](https://github.com/hashicorp/terraform-provider-aws/issues/38194))
* resource/aws_redshift_cluster: Set `encrypted` on snapshot restore, when enabled ([#38828](https://github.com/hashicorp/terraform-provider-aws/issues/38828))
FEATURES:
* **New Data Source:** `aws_rds_cluster_parameter_group` ([#38416](https://github.com/hashicorp/terraform-provider-aws/issues/38416))
* **New Resource:** `aws_rds_integration` ([#35199](https://github.com/hashicorp/terraform-provider-aws/issues/35199))
ENHANCEMENTS:
* resource/aws_db_option_group: Add `skip_destroy` argument ([#29663](https://github.com/hashicorp/terraform-provider-aws/issues/29663))
* resource/aws_db_parameter_group: Add `skip_destroy` argument ([#29663](https://github.com/hashicorp/terraform-provider-aws/issues/29663))
BUG FIXES:
FEATURES:
* **New Resource:** `aws_timestreaminfluxdb_db_instance` ([#37963](https://github.com/hashicorp/terraform-provider-aws/issues/37963))
ENHANCEMENTS:
* resource/aws_db_instance: Add `upgrade_storage_config` argument ([#36904](https://github.com/hashicorp/terraform-provider-aws/issues/36904))
* resource/aws_rds_cluster: Add `performance_insights_enabled`, `performance_insights_kms_key_id`, and `performance_insights_retention_period` arguments ([#29415](https://github.com/hashicorp/terraform-provider-aws/issues/29415))
* resource/aws_rds_cluster: Add `restore_to_point_in_time.source_cluster_resource_id` argument ([#38540](https://github.com/hashicorp/terraform-provider-aws/issues/38540))
* resource/aws_rds_cluster: Mark `restore_to_point_in_time.source_cluster_identifier` as Optional ([#38540](https://github.com/hashicorp/terraform-provider-aws/issues/38540))
BUG FIXES:
* resource/aws_rds_instance: Allow `domain_dns_ips` to use single DNS server IP ([#36500](https://github.com/hashicorp/terraform-provider-aws/issues/36500))
FEATURES:
ENHANCEMENTS:
* resource/aws_db_cluster_snapshot: Add `shared_accounts` argument ([#34885](https://github.com/hashicorp/terraform-provider-aws/issues/34885))
* resource/aws_db_snapshot_copy: Add `shared_accounts` argument ([#34843](https://github.com/hashicorp/terraform-provider-aws/issues/34843))
* resource/aws_rds_cluster: Add `scaling_configuration.seconds_before_timeout` argument ([#38451](https://github.com/hashicorp/terraform-provider-aws/issues/38451))
BUG FIXES:
* resource/aws_rds_cluster: Mark `ca_certificate_identifier` as Computed ([#38437](https://github.com/hashicorp/terraform-provider-aws/issues/38437))
* resource/aws_rds_cluster: Use the configured `copy_tags_to_snapshot` value when `restore_to_point_in_time` is set ([#34044](https://github.com/hashicorp/terraform-provider-aws/issues/34044))
* resource/aws_rds_cluster: Wait for no pending modified values on Update if `apply_immediately` is `true`. This fixes `InvalidParameterCombination` errors when updating `engine_version` ([#38437](https://github.com/hashicorp/terraform-provider-aws/issues/38437))
FEATURES:
* resource/aws_kinesis_firehose_delivery_stream: Add `secrets_manager_configuration` to `redshift_configuration`, `snowflake_configuration`, and `splunk_configuration` ([#38151](https://github.com/hashicorp/terraform-provider-aws/issues/38151))
* **New Resource:** `aws_rds_certificate` ([#35003](https://github.com/hashicorp/terraform-provider-aws/issues/35003))
ENHANCEMENTS:
* resource/aws_db_instance: Add `engine_lifecycle_support` argument ([#37708](https://github.com/hashicorp/terraform-provider-aws/issues/37708))
* resource/aws_rds_cluster: Add `engine_lifecycle_support` argument ([#37708](https://github.com/hashicorp/terraform-provider-aws/issues/37708))
* resource/aws_rds_global_cluster: Add `engine_lifecycle_support` argument ([#37708](https://github.com/hashicorp/terraform-provider-aws/issues/37708))
* resource/aws_redshift_cluster_snapshot: Set `arn` from `DescribeClusterSnapshots` API response ([#37996](https://github.com/hashicorp/terraform-provider-aws/issues/37996))
BUG FIXES:
FEATURES:
ENHANCEMENTS:
* resource/aws_db_instance: Fix `InvalidParameterCombination: A parameter group can't be specified during Read Replica creation for the following DB engine: postgres` errors ([#38227](https://github.com/hashicorp/terraform-provider-aws/issues/38227))
* resource/aws_rds_cluster: Add `ca_certificate_identifier` argument and `ca_certificate_valid_till` attribute ([#37108](https://github.com/hashicorp/terraform-provider-aws/issues/37108))
BUG FIXES:
* aws_dynamodb_kinesis_streaming_destination: Checks for errors other than NotFound when reading. ([#38292](https://github.com/hashicorp/terraform-provider-aws/issues/38292))
* resource/aws_db_instance: Correctly mark incomplete instances as [tainted](https://developer.hashicorp.com/terraform/cli/state/taint#the-tainted-status) during creation ([#38252](https://github.com/hashicorp/terraform-provider-aws/issues/38252))
FEATURES:
ENHANCEMENTS:
BUG FIXES:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
* resource/aws_docdb_cluster: Add `restore_to_point_in_time` argument ([#37716](https://github.com/hashicorp/terraform-provider-aws/issues/37716))
* resource/aws_dynamodb_table: Adds validation for `ttl` values. ([#37991](https://github.com/hashicorp/terraform-provider-aws/issues/37991))
BUG FIXES:
* resource/aws_dynamodb_table: Fixes perpetual diff when `ttl.attribute_name` is set when `ttl.enabled` is not set. ([#37991](https://github.com/hashicorp/terraform-provider-aws/issues/37991))
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
* resource/aws_dynamodb_table: Fix `UnknownOperationException: Tagging is not currently supported in DynamoDB Local` errors on resource Read ([#37924](https://github.com/hashicorp/terraform-provider-aws/issues/37924))
FEATURES:
ENHANCEMENTS:
* data-source/aws_rds_engine_version: Add `supports_limitless_database` attribute ([#37271](https://github.com/hashicorp/terraform-provider-aws/issues/37271))
BUG FIXES:
ENHANCEMENTS:
BUG FIXES:
ENHANCEMENTS:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
* resource/aws_dynamodb_table_replica: Correctly set `kms_key_arn` on Read ([#37570](https://github.com/hashicorp/terraform-provider-aws/issues/37570))
ENHANCEMENTS:
BUG FIXES:
* resource/aws_dynamodb_table: Fix `UnknownOperationException: Tagging is not currently supported in DynamoDB Local` errors on resource Read ([#37472](https://github.com/hashicorp/terraform-provider-aws/issues/37472))
FEATURES:
ENHANCEMENTS:
* resource/aws_dynamodb_table_export: Add plan-time validation of `table_arn` ([#37288](https://github.com/hashicorp/terraform-provider-aws/issues/37288))
BUG FIXES:
* data-source/aws_rds_orderable_db_instance: Fix `InvalidParameterValue: Invalid value 3412 for MaxRecords. Must be between 20 and 1000` errors ([#37251](https://github.com/hashicorp/terraform-provider-aws/issues/37251))
FEATURES:
ENHANCEMENTS:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
* resource/aws_db_instance: Add `dedicated_log_volume` argument ([#36503](https://github.com/hashicorp/terraform-provider-aws/issues/36503))
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
* resource/aws_db_proxy: Fix `interface conversion: interface {} is nil, not map[string]interface {}` panic when `auth` is empty (`{}`) ([#36967](https://github.com/hashicorp/terraform-provider-aws/issues/36967))
* resource/aws_redshift_cluster: The `logging` argument is now deprecated. Use the `aws_redshift_logging` resource instead. ([#36862](https://github.com/hashicorp/terraform-provider-aws/issues/36862))
* resource/aws_redshift_cluster: The `snapshot_copy` argument is now deprecated. Use the `aws_redshift_snapshot_copy` resource instead. ([#36810](https://github.com/hashicorp/terraform-provider-aws/issues/36810))
FEATURES:
* **New Resource:** `aws_redshift_logging` ([#36862](https://github.com/hashicorp/terraform-provider-aws/issues/36862))
* **New Resource:** `aws_redshift_snapshot_copy` ([#36810](https://github.com/hashicorp/terraform-provider-aws/issues/36810))
ENHANCEMENTS:
BUG FIXES:
* resource/aws_securityhub_configuration_policy: Mark `configuration_policy.enabled_standard_arns` as Optional, fixing `InvalidInputException: Invalid semantics: Enabled standards and security control configurations must be configured when Security Hub is enabled` errors ([#36740](https://github.com/hashicorp/terraform-provider-aws/issues/36740))
FEATURES:
ENHANCEMENTS:
* resource/aws_db_instance: Adds warning when setting `character_set_name` when `replicate_source_db`, `restore_to_point_in_time`, or `snapshot_identifier` is set ([#36518](https://github.com/hashicorp/terraform-provider-aws/issues/36518))
BUG FIXES:
* resource/aws_redshift_cluster: Fix error preventing modification of a configured `snapshot_copy` block ([#36655](https://github.com/hashicorp/terraform-provider-aws/issues/36655))
* resource/aws_route53_record: Fix to correctly interpret alias names with wildcards ([#36699](https://github.com/hashicorp/terraform-provider-aws/issues/36699))
FEATURES:
* **New Resource:** `aws_dynamodb_resource_policy` ([#36595](https://github.com/hashicorp/terraform-provider-aws/issues/36595))
* **New Resource:** `aws_redshiftserverless_custom_domain_association` ([#35865](https://github.com/hashicorp/terraform-provider-aws/issues/35865))
ENHANCEMENTS:
* data-source/aws_db_snapshot: Add `original_snapshot_create_time` attribute ([#36544](https://github.com/hashicorp/terraform-provider-aws/issues/36544))
BUG FIXES:
* resource/aws_autoscaling_group: Don't attempt to remove scale-in protection from instances that don't have the feature enabled ([#36586](https://github.com/hashicorp/terraform-provider-aws/issues/36586))
* resource/aws_redshift_cluster: Fix `InvalidParameterCombination` errors when updating only `skip_final_snapshot` ([#36635](https://github.com/hashicorp/terraform-provider-aws/issues/36635))
FEATURES:
* **New Data Source:** `aws_redshift_producer_data_shares` ([#36481](https://github.com/hashicorp/terraform-provider-aws/issues/36481))
* **New Resource:** `aws_dynamodb_table_export` ([#30399](https://github.com/hashicorp/terraform-provider-aws/issues/30399))
ENHANCEMENTS:
* resource/aws_rds_cluster: Add `enable_local_write_forwarding` argument to support Aurora MySQL local write forwarding ([#34370](https://github.com/hashicorp/terraform-provider-aws/issues/34370))
BUG FIXES:
FEATURES:
ENHANCEMENTS:
* resource/aws_securityhub_organization_configuration: Set `auto_enable` to `false`, `auto_enable_standards` to `NONE`, and `organization_configuration.configuration_type` to `LOCAL` on resource Delete ([#35752](https://github.com/hashicorp/terraform-provider-aws/issues/35752))
BUG FIXES:
FEATURES:
ENHANCEMENTS:
* data-source/aws_rds_engine_version: Add `has_major_target` and `has_minor_target` optional arguments and `valid_major_targets` and `valid_minor_targets` attributes ([#36246](https://github.com/hashicorp/terraform-provider-aws/issues/36246))
* resource/aws_db_instance: Add `io2` as a valid value for `storage_type` ([#36252](https://github.com/hashicorp/terraform-provider-aws/issues/36252))
* resource/aws_rds_cluster: Add `io2` as a valid value for `storage_type` ([#36252](https://github.com/hashicorp/terraform-provider-aws/issues/36252))
BUG FIXES:
* data-source/aws_rds_engine_version: Fix bugs that could limit engine version to a default version even when not appropriate ([#36246](https://github.com/hashicorp/terraform-provider-aws/issues/36246))
* resource/aws_db_instance: Correctly sets `parameter_group_name` when `replicate_source_db` is in different region. ([#36080](https://github.com/hashicorp/terraform-provider-aws/issues/36080))
* resource/aws_rds_global_cluster: Fix bugs and delays that could occur when performing major or minor version upgrades ([#36246](https://github.com/hashicorp/terraform-provider-aws/issues/36246))
BUG FIXES:
FEATURES:
* **New Data Source:** `aws_redshift_data_shares` ([#35937](https://github.com/hashicorp/terraform-provider-aws/issues/35937))
ENHANCEMENTS:
* resource/aws_redshiftserverless_namespace:
BUG FIXES:
* data/aws_redshiftserverless_namespace: Properly set `iam_roles` attribute on read ([#35965](https://github.com/hashicorp/terraform-provider-aws/issues/35965))
* resource/aws_redshiftserverless_workgroup: Fix `max_capacity` removal ([#36032](https://github.com/hashicorp/terraform-provider-aws/issues/36032))
* resource/aws_redshiftserverless_workgroup: Fix updating both `base_capacity` and `max_capacity` ([#36032](https://github.com/hashicorp/terraform-provider-aws/issues/36032))
FEATURES:
ENHANCEMENTS:
* data-source/aws_ec2_instance_type: Add `maximum_network_cards` attribute ([#35840](https://github.com/hashicorp/terraform-provider-aws/issues/35840))
* resource/aws_db_instance: Add plan-time validation of `performance_insights_retention_period` ([#35870](https://github.com/hashicorp/terraform-provider-aws/issues/35870))
* resource/aws_redshiftserverless_workgroup: Add `max_capacity` argument ([#35720](https://github.com/hashicorp/terraform-provider-aws/issues/35720))
BUG FIXES:
FEATURES:
* **New Data Source:** `aws_db_parameter_group` ([#35698](https://github.com/hashicorp/terraform-provider-aws/issues/35698))
* **New Resource:** `aws_redshift_data_share_consumer_association` ([#35771](https://github.com/hashicorp/terraform-provider-aws/issues/35771))
ENHANCEMENTS:
* data-source/aws_rds_engine_version: Improve search functionality and options by adding `latest`, `preferred_major_targets`, and `preferred_upgrade_targets`. Add `version_actual` attribute ([#35698](https://github.com/hashicorp/terraform-provider-aws/issues/35698))
* data-source/aws_rds_orderable_db_instance: Improve search functionality and options by adding `engine_latest_version` and `supports_clusters` arguments and converting `read_replica_capable`, `supported_engine_modes`, `supported_network_types`, and `supports_multi_az` to arguments for use as search criteria ([#35698](https://github.com/hashicorp/terraform-provider-aws/issues/35698))
* resource/aws_rds_cluster: Add `domain` and `domain_iam_role_name` arguments to support [Kerberos authentication](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RDS_Fea_Regions_DB-eng.Feature.KerberosAuthentication.html) ([#35753](https://github.com/hashicorp/terraform-provider-aws/issues/35753))
BUG FIXES:
* resource/aws_db_proxy: Change `auth` from `TypeList` to `TypeSet` as order is not significant ([#35819](https://github.com/hashicorp/terraform-provider-aws/issues/35819))
* resource/aws_redshift_data_share_authorization: Fix read operation to properly handle shares in `ACTIVE` status ([#35771](https://github.com/hashicorp/terraform-provider-aws/issues/35771))
FEATURES:
* **New Resource:** `aws_redshift_data_share_authorization` ([#35703](https://github.com/hashicorp/terraform-provider-aws/issues/35703))
ENHANCEMENTS:
* resource/aws_db_instance: Add `diag.log` and `notify.log` as valid values for `enabled_cloudwatch_logs_exports` ([#35626](https://github.com/hashicorp/terraform-provider-aws/issues/35626))
* resource/aws_db_instance: Add `domain_auth_secret_arn`, `domain_dns_ips`, `domain_fqdn`, and `domain_ou` arguments to support [self-managed Active Directory](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_SQLServer_SelfManagedActiveDirectory.html) ([#35500](https://github.com/hashicorp/terraform-provider-aws/issues/35500))
BUG FIXES:
* resource/aws_db_instance: Creating resource from point-in-time recovery now handles `password` attribute correctly ([#35589](https://github.com/hashicorp/terraform-provider-aws/issues/35589))
* resource/aws_dynamodb_table: Ensure that `replica`s are always set on Read ([#35630](https://github.com/hashicorp/terraform-provider-aws/issues/35630))
FEATURES:
ENHANCEMENTS:
* data-source/aws_redshift_cluster: Add `multi_az` attribute ([#35508](https://github.com/hashicorp/terraform-provider-aws/issues/35508))
* resource/aws_redshift_cluster: Add `multi_az` argument ([#35508](https://github.com/hashicorp/terraform-provider-aws/issues/35508))
* resource/aws_redshiftserverless_endpoint_access: Add `owner_account` argument ([#35509](https://github.com/hashicorp/terraform-provider-aws/issues/35509))
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
* resource/aws_kinesis_firehose_delivery_stream: Adjust `elasticsearch_configuration.buffering_interval`, `http_endpoint_configuration.buffering_interval`, `opensearch_configuration.buffering_interval`, `opensearchserverless_configuration.buffering_interval`, `redshift_configuration.s3_backup_configuration.buffering_interval`,`extended_s3_configuration.s3_backup_configuration.buffering_interval`, `elasticsearch_configuration.s3_configuration.buffering_interval`, `http_endpoint_configuration.s3_configuration.buffering_interval`, `opensearch_configuration.s3_configuration.buffering_interval`, `opensearchserverless_configuration.s3_configuration.buffering_interval`, `redshift_configuration.s3_configuration.buffering_interval` and `splunk_configuration.s3_configuration.buffering_interval` minimum values to `0` to support zero buffering ([#35137](https://github.com/hashicorp/terraform-provider-aws/issues/35137))
* resource/aws_redshiftserverless_workgroup: Add `port` argument ([#34925](https://github.com/hashicorp/terraform-provider-aws/issues/34925))
BUG FIXES:
* resource/aws_dynamodb_table: Fix error when waiting for snapshot to be created ([#34848](https://github.com/hashicorp/terraform-provider-aws/issues/34848))
FEATURES:
ENHANCEMENTS:
* resource/aws_db_instance: Add support for IBM Db2 databases ([#34834](https://github.com/hashicorp/terraform-provider-aws/issues/34834))
BUG FIXES:
* resource/aws_db_instance: Fix error where Terraform loses track of resource if Blue/Green Deployment is applied outside of Terraform ([#34728](https://github.com/hashicorp/terraform-provider-aws/issues/34728))
FEATURES:
ENHANCEMENTS:
BUG FIXES:
FEATURES:
* **New Resource:** `aws_docdbelastic_cluster` ([#31033](https://github.com/hashicorp/terraform-provider-aws/issues/31033))
ENHANCEMENTS:
* resource/aws_docdb_cluster: Add `storage_type` argument ([#34637](https://github.com/hashicorp/terraform-provider-aws/issues/34637))
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
* resource/aws_rds_cluster: Add `delete_automated_backups` argument ([#34309](https://github.com/hashicorp/terraform-provider-aws/issues/34309))
BUG FIXES:
FEATURES:
ENHANCEMENTS:
* resource/aws_db_instance: Add `postgres` as a valid `engine` value for blue/green deployments ([#34216](https://github.com/hashicorp/terraform-provider-aws/issues/34216))
* resource/aws_route53_record: Allow import of records with an empty record name. ([#34212](https://github.com/hashicorp/terraform-provider-aws/issues/34212))
* resource/aws_sagemaker_feature_group: Add `offline_store_config.s3_storage_config.resolved_output_s3_uri`, `online_store_config.storage_type` and `online_store_config.ttl_duration` arguments ([#34283](https://github.com/hashicorp/terraform-provider-aws/issues/34283))
* resource/aws_sagemaker_feature_group: Allow `online_store_config.ttl_duration` to be updated in-place ([#34283](https://github.com/hashicorp/terraform-provider-aws/issues/34283))
BUG FIXES:
FEATURES:
* **New Resource:** `aws_redshift_resource_policy` ([#34149](https://github.com/hashicorp/terraform-provider-aws/issues/34149))
ENHANCEMENTS:
* resource/aws_rds_cluster: Remove the provider default (previously, "1") and use the AWS default for `backup_retention_period` (also, "1") to allow integration with AWS Backup ([#34187](https://github.com/hashicorp/terraform-provider-aws/issues/34187))
* resource/aws_redshift_cluster: Add `snapshot_arn` argument ([#34181](https://github.com/hashicorp/terraform-provider-aws/issues/34181))
* resource/aws_redshift_cluster: Add the `manage_master_password` and `master_password_secret_kms_key_id` arguments to support managed admin credentials ([#34182](https://github.com/hashicorp/terraform-provider-aws/issues/34182))
BUG FIXES:
* resource/aws_rds_cluster: Avoid an error on delete related to `unexpected state 'scaling-compute'` ([#34187](https://github.com/hashicorp/terraform-provider-aws/issues/34187))
BUG FIXES:
* provider: This release includes an update to the AWS SDK for Go v2 with breaking type changes to several services: `finspace`, `kafka`, `medialive`, `rds`, `s3control`, `timestreamwrite`, and `xray`. These changes primarily affect how arguments with default values are serialized for outbound requests, changing scalar types to pointers. See [this AWS SDK for Go V2 issue](https://github.com/aws/aws-sdk-go-v2/issues/2162) for additional context. The corresponding provider changes should make this breakfix transparent to users, but as with any breaking change there is the potential for missed edge cases. If errors are observed in the impacted resources, please link to this dependency update pull request in the bug report. ([#34096](https://github.com/hashicorp/terraform-provider-aws/issues/34096))
FEATURES:
ENHANCEMENTS:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
* resource/aws_db_option_group: Support import of `name_prefix` argument ([#33852](https://github.com/hashicorp/terraform-provider-aws/issues/33852))
* resource/aws_docdb_cluster: Support import of `cluster_identifier_prefix` argument ([#33852](https://github.com/hashicorp/terraform-provider-aws/issues/33852))
* resource/aws_docdb_cluster_instance: Support import of `identifier_prefix` argument ([#33852](https://github.com/hashicorp/terraform-provider-aws/issues/33852))
* resource/aws_docdb_cluster_parameter_group: Support import of `name_prefix` argument ([#33852](https://github.com/hashicorp/terraform-provider-aws/issues/33852))
* resource/aws_docdb_subnet_group: Support import of `name_prefix` argument ([#33852](https://github.com/hashicorp/terraform-provider-aws/issues/33852))
* resource/aws_rds_cluster: Support import of `cluster_identifier_prefix` argument ([#33852](https://github.com/hashicorp/terraform-provider-aws/issues/33852))
* resource/aws_rds_cluster_instance: Support import of `identifier_prefix` argument ([#33852](https://github.com/hashicorp/terraform-provider-aws/issues/33852))
BUG FIXES:
* resource/aws_db_instance: Creating resource from snapshot or point-in-time recovery now handles `manage_master_user_password` and `master_user_secret_kms_key_id` attributes correctly ([#33699](https://github.com/hashicorp/terraform-provider-aws/issues/33699))
FEATURES:
* **New Resource:** `aws_guardduty_organization_configuration_feature` ([#33913](https://github.com/hashicorp/terraform-provider-aws/issues/33913))
ENHANCEMENTS:
* resource/aws_docdb_cluster: Add `allow_major_version_upgrade` argument ([#33790](https://github.com/hashicorp/terraform-provider-aws/issues/33790))
* resource/aws_docdb_cluster_instance: Add `copy_tags_to_snapshot` argument ([#31022](https://github.com/hashicorp/terraform-provider-aws/issues/31022))
* resource/aws_dynamodb_table: Add `import_table` configuration block ([#33802](https://github.com/hashicorp/terraform-provider-aws/issues/33802))
* resource/aws_redshiftserverless_workgroup: Allow `require_ssl` and `use_fips_ssl` `config_parameters` keys ([#33916](https://github.com/hashicorp/terraform-provider-aws/issues/33916))
BUG FIXES:
* resource/aws_db_parameter_group: Group names containing periods (`.`) no longer fail validation ([#33704](https://github.com/hashicorp/terraform-provider-aws/issues/33704))
* resource/aws_rds_cluster_parameter_group: Group names containing periods (`.`) no longer fail validation ([#33704](https://github.com/hashicorp/terraform-provider-aws/issues/33704))
FEATURES:
* **New Resource:** `aws_guardduty_detector_feature` ([#31463](https://github.com/hashicorp/terraform-provider-aws/issues/31463))
ENHANCEMENTS:
* data-source/aws_guardduty_detector: Add `features` attribute ([#31463](https://github.com/hashicorp/terraform-provider-aws/issues/31463))
BUG FIXES:
FEATURES:
* **New Resource:** `aws_rds_custom_db_engine_version` ([#33285](https://github.com/hashicorp/terraform-provider-aws/issues/33285))
ENHANCEMENTS:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
* resource/aws_db_instance: Fix so that `storage_throughput` can be changed when `iops` and `allocated_storage` are not changed ([#33529](https://github.com/hashicorp/terraform-provider-aws/issues/33529))
* resource/aws_db_option_group: Avoid erroneous differences being reported when an `option` `port` and/or `version` is not set ([#33511](https://github.com/hashicorp/terraform-provider-aws/issues/33511))
FEATURES:
ENHANCEMENTS:
BUG FIXES:
* resource/aws_neptune_cluster: Fix ignored `kms_key_arn` on restore from DB cluster snapshot ([#33413](https://github.com/hashicorp/terraform-provider-aws/issues/33413))
FEATURES:
ENHANCEMENTS:
BUG FIXES:
BUG FIXES:
* resource/aws_db_instance_automated_backups_replication: Fix `unexpected state` errors on resource Create ([#33369](https://github.com/hashicorp/terraform-provider-aws/issues/33369))
FEATURES:
ENHANCEMENTS:
* resource/aws_api_gateway_account: Add `api_key_version` and `features` attributes ([#33279](https://github.com/hashicorp/terraform-provider-aws/issues/33279))
* resource/aws_dms_endpoint: Add `redshift-serverless` as valid value for `engine_name` ([#33316](https://github.com/hashicorp/terraform-provider-aws/issues/33316))
BUG FIXES:
ENHANCEMENTS:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
* resource/aws_rds_global_cluster: Add plan-time validation of `global_cluster_identifier` ([#30996](https://github.com/hashicorp/terraform-provider-aws/issues/30996))
BUG FIXES:
FEATURES:
ENHANCEMENTS:
* data-source/aws_rds_cluster: Add `db_system_id` attribute ([#32846](https://github.com/hashicorp/terraform-provider-aws/issues/32846))
* resource/aws_rds_cluster: Add `db_system_id` argument to support RDS Custom engine types ([#32846](https://github.com/hashicorp/terraform-provider-aws/issues/32846))
* resource/aws_rds_cluster_instance: Add `custom_iam_instance_profile` argument to allow RDS Custom users to specify an IAM Instance Profile for the RDS Cluster Instance ([#32846](https://github.com/hashicorp/terraform-provider-aws/issues/32846))
* resource/aws_rds_cluster_instance: Update `engine` plan-time validation to allow for RDS Custom engine types ([#32846](https://github.com/hashicorp/terraform-provider-aws/issues/32846))
BUG FIXES:
* resource/aws_db_instance: Fix crash creating resource with empty `restore_to_point_in_time` configuration block ([#32928](https://github.com/hashicorp/terraform-provider-aws/issues/32928))
FEATURES:
ENHANCEMENTS:
* data-source/aws_db_cluster_snapshot: Add `tags` argument ([#31602](https://github.com/hashicorp/terraform-provider-aws/issues/31602))
* data-source/aws_db_instance: Add ability to filter by `tags` ([#32740](https://github.com/hashicorp/terraform-provider-aws/issues/32740))
* data-source/aws_db_instances: Add ability to filter by `tags` ([#32740](https://github.com/hashicorp/terraform-provider-aws/issues/32740))
* data-source/aws_db_snapshot: Add `tags` argument ([#31600](https://github.com/hashicorp/terraform-provider-aws/issues/31600))
BUG FIXES:
* resource/aws_db_instance_automated_backups_replication: Fix `unexpected state 'Pending'` errors on resource Create ([#31600](https://github.com/hashicorp/terraform-provider-aws/issues/31600))
FEATURES:
ENHANCEMENTS:
BUG FIXES:
* resource/aws_finspace_kx_cluster: `database.cache_configurations.db_paths` argument is now optional ([#32579](https://github.com/hashicorp/terraform-provider-aws/issues/32579))
FEATURES:
ENHANCEMENTS:
* data-source/aws_db_instance: Add `max_allocated_storage` attribute ([#32477](https://github.com/hashicorp/terraform-provider-aws/issues/32477))
* resource/aws_db_instance: Add `backup_target` attribute ([#32609](https://github.com/hashicorp/terraform-provider-aws/issues/32609))
BUG FIXES:
ENHANCEMENTS:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
BUG FIXES:
BUG FIXES:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
* resource/aws_pipes_pipe: Add `activemq_broker_parameters`, `dynamodb_stream_parameters`, `kinesis_stream_parameters`, `managed_streaming_kafka_parameters`, `rabbitmq_broker_parameters`, `self_managed_kafka_parameters` and `sqs_queue_parameters` attributes to the `source_parameters` configuration block. NOTE: Because we cannot easily test all this functionality, it is best effort and we ask for community help in testing ([#31607](https://github.com/hashicorp/terraform-provider-aws/issues/31607))
* resource/aws_pipes_pipe: Add `batch_job_parameters`, `cloudwatch_logs_parameters`, `ecs_task_parameters`, `eventbridge_event_bus_parameters`, `http_parameters`, `kinesis_stream_parameters`, `lambda_function_parameters`, `redshift_data_parameters`, `sagemaker_pipeline_parameters`, `sqs_queue_parameters` and `step_function_state_machine_parameters` attributes to the `target_parameters` configuration block. NOTE: Because we cannot easily test all this functionality, it is best effort and we ask for community help in testing ([#31607](https://github.com/hashicorp/terraform-provider-aws/issues/31607))
BUG FIXES:
* resource/aws_db_instance: Fix resource Create returning instances not in the `available` state when `identifier_prefix` is specified ([#32287](https://github.com/hashicorp/terraform-provider-aws/issues/32287))
FEATURES:
ENHANCEMENTS:
BUG FIXES:
* resource/aws_redshiftserverless_workgroup: Fix `waiting for completion: unexpected state 'AVAILABLE'` errors when deleting resource ([#32067](https://github.com/hashicorp/terraform-provider-aws/issues/32067))
FEATURES:
ENHANCEMENTS:
BUG FIXES:
FEATURES:
ENHANCEMENTS:
* data-source/aws_redshift_cluster: Add `cluster_namespace_arn` attribute ([#31884](https://github.com/hashicorp/terraform-provider-aws/issues/31884))
* resource/aws_redshift_cluster: Add `cluster_namespace_arn` attribute ([#31884](https://github.com/hashicorp/terraform-provider-aws/issues/31884))
BUG FIXES:
* resource/aws_redshift_cluster: Allow `availability_zone_relocation_enabled` to be `true` when `publicly_accessible` is `true` ([#31886](https://github.com/hashicorp/terraform-provider-aws/issues/31886))
FEATURES:
ENHANCEMENTS:
* resource/aws_redshiftserverless_workgroup: Additional supported values for `config_parameter.parameter_key` ([#31747](https://github.com/hashicorp/terraform-provider-aws/issues/31747))
BUG FIXES:
* data-source/aws_redshift_cluster: Fix crash reading clusters in `modifying` state ([#31772](https://github.com/hashicorp/terraform-provider-aws/issues/31772))
* resource/aws_redshiftserverless_namespace: Fix perpetual `iam_roles` diffs when the namespace contains a workgroup ([#31749](https://github.com/hashicorp/terraform-provider-aws/issues/31749))
* resource/aws_redshiftserverless_workgroup: Change `config_parameter` from `TypeList` to `TypeSet` as order is not significant ([#31747](https://github.com/hashicorp/terraform-provider-aws/issues/31747))
* resource/aws_redshiftserverless_workgroup: Fix `ValidationException: Can't update multiple configurations at the same time` errors ([#31747](https://github.com/hashicorp/terraform-provider-aws/issues/31747))
* resource/aws_redshift_cluster: Ignores the parameter `aqua_configuration_status`, since the AWS API ignores it. Now always returns `auto`. ([#31612](https://github.com/hashicorp/terraform-provider-aws/issues/31612))
FEATURES:
ENHANCEMENTS:
BUG FIXES:
* resource/aws_rds_cluster: Correctly update `db_cluster_instance_class` ([#31709](https://github.com/hashicorp/terraform-provider-aws/issues/31709))
* resource/aws_redshift_cluster: No longer errors on deletion when status is `Maintenance` ([#31612](https://github.com/hashicorp/terraform-provider-aws/issues/31612))
BUG FIXES:
* data-source/aws_db_instance: With the retirement of EC2-Classic the `db_security_groups` attribute has been removed ([#30966](https://github.com/hashicorp/terraform-provider-aws/issues/30966))
* data-source/aws_redshift_cluster: With the retirement of EC2-Classic the `cluster_security_groups` attribute has been removed ([#30966](https://github.com/hashicorp/terraform-provider-aws/issues/30966))
* provider: With the retirement of EC2-Classic the `aws_db_security_group` resource has been removed ([#30966](https://github.com/hashicorp/terraform-provider-aws/issues/30966))
* provider: With the retirement of EC2-Classic the `aws_redshift_security_group` resource has been removed ([#30966](https://github.com/hashicorp/terraform-provider-aws/issues/30966))
* resource/aws_db_instance: Remove `name` - use `db_name` instead ([#31232](https://github.com/hashicorp/terraform-provider-aws/issues/31232))
* resource/aws_db_instance: With the retirement of EC2-Classic the `security_group_names` attribute has been removed ([#30966](https://github.com/hashicorp/terraform-provider-aws/issues/30966))
* resource/aws_db_instance: `id` is no longer the AWS database `identifier` - `id` is now the `dbi-resource-id`. Refer to `identifier` instead of `id` to use the database's identifier ([#31232](https://github.com/hashicorp/terraform-provider-aws/issues/31232))
* resource/aws_docdb_cluster: `snapshot_identifier` change now properly forces replacement ([#29409](https://github.com/hashicorp/terraform-provider-aws/issues/29409))
* resource/aws_kinesis_firehose_delivery_stream: Remove `s3_configuration` attribute from the root of the resource. `s3_configuration` is now a part of the following blocks: `elasticsearch_configuration`, `opensearch_configuration`, `redshift_configuration`, `splunk_configuration`, and `http_endpoint_configuration` ([#31138](https://github.com/hashicorp/terraform-provider-aws/issues/31138))
* resource/aws_kinesis_firehose_delivery_stream: Rename `redshift_configuration.0.s3_backup_configuration.0.buffer_size` and `redshift_configuration.0.s3_backup_configuration.0.buffer_interval` to `redshift_configuration.0.s3_backup_configuration.0.buffering_size` and `redshift_configuration.0.s3_backup_configuration.0.buffering_interval`, respectively ([#31141](https://github.com/hashicorp/terraform-provider-aws/issues/31141))
* resource/aws_rds_cluster: The `engine` argument is now required and has no default ([#31112](https://github.com/hashicorp/terraform-provider-aws/issues/31112))
* resource/aws_rds_cluster: `snapshot_identifier` change now properly forces replacement ([#29409](https://github.com/hashicorp/terraform-provider-aws/issues/29409))
* resource/aws_rds_cluster_instance: The `engine` argument is now required and has no default ([#31112](https://github.com/hashicorp/terraform-provider-aws/issues/31112))
* resource/aws_redshift_cluster: With the retirement of EC2-Classic the `cluster_security_groups` attribute has been removed ([#30966](https://github.com/hashicorp/terraform-provider-aws/issues/30966))
* data-source/aws_redshift_service_account: The `aws_redshift_service_account` data source has been deprecated and will be removed in a future version. AWS documentation [states that](https://docs.aws.amazon.com/redshift/latest/mgmt/db-auditing.html#db-auditing-bucket-permissions) a [service principal name](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services) should be used instead of an AWS account ID in any relevant IAM policy ([#31006](https://github.com/hashicorp/terraform-provider-aws/issues/31006))
* resource/aws_db_event_subscription: Configurations that define `source_ids` using the `id` attribute of `aws_db_instance` must be updated to use `identifier` instead - for example, `source_ids = [aws_db_instance.example.id]` must be updated to `source_ids = [aws_db_instance.example.identifier]` ([#31232](https://github.com/hashicorp/terraform-provider-aws/issues/31232))
* resource/aws_db_instance: Configurations that define `replicate_source_db` using the `id` attribute of `aws_db_instance` must be updated to use `identifier` instead - for example, `replicate_source_db = aws_db_instance.example.id` must be updated to `replicate_source_db = aws_db_instance.example.identifier` ([#31232](https://github.com/hashicorp/terraform-provider-aws/issues/31232))
* resource/aws_db_instance: The change of what `id` is, namely, a DBI Resource ID now versus DB Identifier previously, has far-reaching consequences. Configurations that refer to, for example, `aws_db_instance.example.id` will now have errors and must be changed to use `identifier` instead, for example, `aws_db_instance.example.identifier` ([#31232](https://github.com/hashicorp/terraform-provider-aws/issues/31232))
* resource/aws_db_instance_role_association: Configurations that define `db_instance_identifier` using the `id` attribute of `aws_db_instance` must be updated to use `identifier` instead - for example, `db_instance_identifier = aws_db_instance.example.id` must be updated to `db_instance_identifier = aws_db_instance.example.identifier` ([#31232](https://github.com/hashicorp/terraform-provider-aws/issues/31232))
* resource/aws_db_proxy_target: Configurations that define `db_instance_identifier` using the `id` attribute of `aws_db_instance` must be updated to use `identifier` instead - for example, `db_instance_identifier = aws_db_instance.example.id` must be updated to `db_instance_identifier = aws_db_instance.example.identifier` ([#31232](https://github.com/hashicorp/terraform-provider-aws/issues/31232))
* resource/aws_db_snapshot: Configurations that define `db_instance_identifier` using the `id` attribute of `aws_db_instance` must be updated to use `identifier` instead - for example, `db_instance_identifier = aws_db_instance.example.id` must be updated to `db_instance_identifier = aws_db_instance.example.identifier` ([#31232](https://github.com/hashicorp/terraform-provider-aws/issues/31232))
* resource/aws_docdb_cluster: Changes to the `snapshot_identifier` attribute will now trigger a replacement, rather than an in-place update. This corrects the previous behavior which resulted in a successful apply, but did not actually restore the cluster from the designated snapshot. ([#29409](https://github.com/hashicorp/terraform-provider-aws/issues/29409))
* resource/aws_rds_cluster: Changes to the `snapshot_identifier` attribute will now trigger a replacement, rather than an in-place update. This corrects the previous behavior which resulted in a successful apply, but did not actually restore the cluster from the designated snapshot. ([#29409](https://github.com/hashicorp/terraform-provider-aws/issues/29409))
* resource/aws_rds_cluster: Configurations not including the `engine` argument must be updated to include `engine` as it is now required. Previously, not including `engine` was equivalent to `engine = "aurora"` and created a MySQL-5.6-compatible cluster ([#31112](https://github.com/hashicorp/terraform-provider-aws/issues/31112))
* resource/aws_rds_cluster_instance: Configurations not including the `engine` argument must be updated to include `engine` as it is now required. Previously, not including `engine` was equivalent to `engine = "aurora"` and created a MySQL-5.6-compatible cluster instance ([#31112](https://github.com/hashicorp/terraform-provider-aws/issues/31112))
ENHANCEMENTS:
* resource/aws_db_instance: Updates to `identifier` and `identifier_prefix` will no longer cause the database instance to be destroyed and recreated ([#31232](https://github.com/hashicorp/terraform-provider-aws/issues/31232))
* resource/aws_kinesis_firehose_delivery_stream: Add `s3_configuration` to `elasticsearch_configuration`, `opensearch_configuration`, `redshift_configuration`, `splunk_configuration`, and `http_endpoint_configuration` ([#31138](https://github.com/hashicorp/terraform-provider-aws/issues/31138))
BUG FIXES:
