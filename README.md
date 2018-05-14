Repository for the image used in containerized ConvergDB jobs.

### Local invocation

```
export AWS_ACCESS_KEY_ID=yoursecret
export AWS_SECRET_ACCESS_KEY=yoursecret
export AWS_REGION=us-west-2
export CONVERGDB_SCRIPT=s3://convergdb-admin-abfe4651b6737196/abfe4651b6737196/scripts/aws_glue/demo2/demo2.py
export CONVERGDB_LIBRARY=s3://convergdb-admin-abfe4651b6737196/abfe4651b6737196/scripts/aws_glue/demo2/convergdb.zip
docker run \
-e AWS_SECRET_ACCESS_KEY \
-e AWS_ACCESS_KEY_ID \
-e AWS_REGION \
-e CONVERGDB_LIBRARY \
-e CONVERGDB_SCRIPT \
convergdb-spark:latest
```
