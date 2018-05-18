#!/bin/bash
cat /etc/hosts
export HOSTNAME=localhost
env

export SCRIPT_HOME=/tmp
aws s3 cp $CONVERGDB_LIBRARY $SCRIPT_HOME/convergdb.zip
aws s3 cp $CONVERGDB_SCRIPT  $SCRIPT_HOME/run.py

spark-submit --master local[1] $SCRIPT_HOME/run.py