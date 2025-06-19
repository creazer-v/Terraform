
## 6.1.0 (Unreleased)


## 6.0.0 (June 18, 2025)


NOTES:
* resource/aws_redshift_cluster: The default value of `encrypted` is now `true` to match the AWS API. ([#42631](https://github.com/hashicorp/terraform-provider-aws/issues/42631))

ENHANCEMENTS:

BUG FIXES:
* resource/aws_redshift_cluster: Fixes permanent diff when `encrypted` is not explicitly set to `true`. ([#42631](https://github.com/hashicorp/terraform-provider-aws/issues/42631))
