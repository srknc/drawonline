#!/bin/bash
set -e


bucket_administrative=cloudformation-1548978758
hosted_zone_id=ZE05893RK9IXZ
root_domain_name=drawonline.io


# get current region
region=$(aws configure list | grep region | awk {'print $2'})

# upload templates
for i in $(ls *.yaml)
do
  aws s3 cp $i s3://$bucket_administrative/ 
done


# update cloudformation
aws cloudformation update-stack \
  --stack-name drawonline \
  --template-url https://s3.amazonaws.com/$bucket_administrative/root.yaml \
  --parameters  ParameterKey=RootDomainName,ParameterValue=$root_domain_name \
                ParameterKey=HostedZoneId,ParameterValue=$hosted_zone_id \
                ParameterKey=BucketAdministrativeName,ParameterValue=$bucket_administrative \
  --capabilities CAPABILITY_IAM
