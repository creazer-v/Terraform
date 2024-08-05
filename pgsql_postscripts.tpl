#!/bin/bash -xe
##################################################################################################################################################################
# Program       :  pgsql_postscripts.tpl
# Programmer    :  Service Catalog DB Team
# Notes         :  As part of post script provisioning the script would
#                  1. Updates the credentials of infrastructure accounts by fetching the credentials from vault
# IMPORTANT     : Copyright  (c) 2023 by ElevanceHealth.
#                 All Rights Reserved.
##################################################################################################################################################################

sudo su
exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1
cd /home/ec2-user
error() {
  echo "Error on line $1: $2" >postscripts_error.log 2>&1
  aws sns publish --topic-arn arn:aws:sns:${aws_region}:${account_id}:antmdbes-database-status-topic --message "Error on line $1: $2" \
    --subject "EH Cloud Database Services Post Script ERROR for ${aws_region}:${account_id}:${identifier}"
  eval $(aws sts assume-role \
    --role-arn arn:aws:iam::868159525660:role/CROSS-ACCOUNT-ROLE-SECRETS-TO-LAMBDA-RDS \
    --role-session-name=test --duration-seconds 900 \
    --query 'join(``, [`export `, `AWS_ACCESS_KEY_ID=`, 
 Credentials.AccessKeyId, ` ; export `, `AWS_SECRET_ACCESS_KEY=`,
 Credentials.SecretAccessKey, `; export `, `AWS_SESSION_TOKEN=`,
 Credentials.SessionToken])' \
    --output text)
  aws s3 cp . s3://eh-dbaservices-log-${region}/pgsql/postscript/logs/${instance_address}/ --exclude "*" --include "postscripts_error.log" --recursive --region ${aws_region}
  aws s3 cp /home/ec2-user/pgsql_scripts/ s3://eh-dbaservices-log-${region}/pgsql/postscript/logs/${instance_address}/ --exclude "*" --include "*.log" --recursive --region ${aws_region}
  unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
  exit 1
}
trap 'error $LINENO "$BASH_COMMAND"' ERR
eval $(aws sts assume-role \
  --role-arn arn:aws:iam::868159525660:role/CROSS-ACCOUNT-ROLE-SECRETS-TO-LAMBDA-RDS \
  --role-session-name=test --duration-seconds 900 \
  --query 'join(``, [`export `, `AWS_ACCESS_KEY_ID=`, 
 Credentials.AccessKeyId, ` ; export `, `AWS_SECRET_ACCESS_KEY=`,
 Credentials.SecretAccessKey, `; export `, `AWS_SESSION_TOKEN=`,
 Credentials.SessionToken])' \
  --output text)

aws s3 cp s3://antmdb-dbaservices-${region}/pgsql/postscript/scripts pgsql_scripts --recursive --region ${aws_region} || error $LINENO "Failed to connect to s3 for importing the postscripts"

unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
export ws_name='${TFC_WORKSPACE_NAME}'
export organization='${business-division}'
export tfe_token='${tfe_read_token}'
export environment='${environment}'
export Hostname='${instance_address}'
export dbinstance='${instance_address}'
export PGPASSWORD='${result}'

cd pgsql_scripts
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN

psql --host=${instance_address} --port=5432 --username=antmsysdba --dbname=postgres <pgsql_main.sql >pgsql_main.log 2>&1 || error $LINENO "Failed to connect to RDS PgSQL Database for running the postscripts"

chmod 777 pgsql-manage-credentials.sh

source pgsql-manage-credentials.sh

eval $(aws sts assume-role \
  --role-arn arn:aws:iam::868159525660:role/CROSS-ACCOUNT-ROLE-SECRETS-TO-LAMBDA-RDS \
  --role-session-name=test --duration-seconds 900 \
  --query 'join(``, [`export `, `AWS_ACCESS_KEY_ID=`, 
 Credentials.AccessKeyId, ` ; export `, `AWS_SECRET_ACCESS_KEY=`,
 Credentials.SecretAccessKey, `; export `, `AWS_SESSION_TOKEN=`,
 Credentials.SessionToken])' \
  --output text)

aws s3 cp /home/ec2-user/pgsql_scripts/ s3://eh-dbaservices-log-${region}/pgsql/postscript/logs/${instance_address}/ --exclude "*" --include "*.log" --recursive --region ${aws_region} || error $LINENO "Failed to connect to s3 for exporting the postscripts logs"
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
shutdown -h now
