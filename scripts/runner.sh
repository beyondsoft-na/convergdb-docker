#!/bin/bash
# temporary fix for hostname until ecs agent is updated
echo "127.0.0.1 $HOSTNAME" >> /etc/hosts

export creds=`aws sts get-session-token`
export AWS_ACCESS_KEY_ID=`echo $creds | jq -r ".Credentials.AccessKeyId"`
export AWS_SECRET_ACCESS_KEY=`echo $creds | jq -r ".Credentials.SecretAccessKey"`
export AWS_SESSION_TOKEN=`echo $creds | jq -r ".Credentials.SessionToken"`

export SCRIPT_HOME=/tmp
aws s3 cp $CONVERGDB_LIBRARY $SCRIPT_HOME/convergdb.zip
aws s3 cp $CONVERGDB_SCRIPT  $SCRIPT_HOME/run.py

spark-submit --master spark://127.0.0.1:7707 $SCRIPT_HOME/run.py