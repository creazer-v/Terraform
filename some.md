#!/bin/bash

# Redirect all output to both terminal and log file from the start
exec 1> >(tee -a mysql-manage-credentials.log) 2>&1

AWS_ACC_NUM=$(aws sts get-caller-identity --output text | awk '{ print $1 }'| sed 's/\s/?/g')
export VAULT_ADDR=https://vault.acr.awsdns.internal.das
vault login -no-print -method=aws role=elvdb-$AWS_ACC_NUM
echo "Started executing mysql-manage-credentials.sh at : $(date)"

if [ "$environment" != "production" ]; then
    echo "Started executing Password Reset at : $(date)"
    mysqlnp=$(vault kv list corp-antmdb/aws-mysql-nonprod/db-infra-service-accounts.anthem.com/ | tail -n +3)
    for db in ${mysqlnp[@]}; do
       username=$(vault kv get -field=username corp-antmdb/aws-mysql-nonprod/db-infra-service-accounts.anthem.com/$db/)
       KVMOUNT=$(vault kv get corp-antmdb/aws-mysql-nonprod/db-infra-service-accounts.anthem.com/$db | sed -n '2 p')
       echo "Reading Infrastructure credentials from KV Mount - $KVMOUNT"
       password=$(vault kv get -field=password corp-antmdb/aws-mysql-nonprod/db-infra-service-accounts.anthem.com/$db/)
       echo "Reading Password for $username from vault"
       mysql -h ${Hostname} -P3306 --ssl-ca=global-bundle.pem -u antmsysdb -p$MySQLPWD -e "alter user '$username'@'%' identified by '$password'" 2>&1 | tee mysql-sql.log
       sql_cmd=${PIPESTATUS[0]}
       sql_err=$(grep -i ERR mysql-sql.log || echo "")
       if [[ $sql_cmd -eq 0 && -z $sql_err ]]; then
          echo "Password reset is successful for $username"
       else 
          echo "Error - Resetting password for $username"
          echo "$sql_err"
       fi
       echo ""
    done
    echo "Completed executing Password Reset at : $(date)"
    echo " "
elif [ "$environment" == "production" ]; then
    echo "Started executing Password Reset at : $(date)"
    mysqlprd=$(vault kv list corp-antmdb/aws-mysql-prod/db-infra-service-accounts.anthem.com/ | tail -n +3)
    for db in ${mysqlprd[@]}; do
       username=$(vault kv get -field=username corp-antmdb/aws-mysql-prod/db-infra-service-accounts.anthem.com/$db/)
       KVMOUNT=$(vault kv get corp-antmdb/aws-mysql-prod/db-infra-service-accounts.anthem.com/$db | sed -n '2 p')
       echo "Reading Infrastructure credentials from KV Mount - $KVMOUNT"
       password=$(vault kv get -field=password corp-antmdb/aws-mysql-prod/db-infra-service-accounts.anthem.com/$db/)
       echo "Reading Password for $username from vault"
       mysql -h ${Hostname} -P3306 --ssl-ca=global-bundle.pem -u antmsysdba -p$MySQLPWD -e "alter user '$username'@'%' identified by '$password'" 2>&1 | tee mysql-sql.log
       sql_cmd=${PIPESTATUS[0]}
       sql_err=$(grep -i ERR mysql-sql.log || echo "")
       if [[ $sql_cmd -eq 0 && -z $sql_err ]]; then
          echo "Password reset is successful for $username"
       else 
          echo "Error - Resetting password for $username"
          echo "$sql_err"
       fi
       echo ""
    done
    echo "Completed executing Password Reset at : $(date)"
    echo " "
fi
echo "Completed executing mysql-manage-credentials.sh at : $(date)"
