#!/bin/bash
echo "127.0.0.1 $HOSTNAME" >> /etc/hosts
cat /etc/hosts
env

export SCRIPT_HOME=/tmp
aws s3 cp $CONVERGDB_LIBRARY $SCRIPT_HOME/convergdb.zip
aws s3 cp $CONVERGDB_SCRIPT  $SCRIPT_HOME/run.py

spark-submit --master spark://127.0.0.1:7707 $SCRIPT_HOME/run.py