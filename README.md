# HashiConf 2019
This repository contains Terraform code, Sentinel policies, and Sentinel mocks for my HashiConf 2019 session called [Testing Terraform Sentinel Policies Using Mocks](https://hashiconf.hashicorp.com/schedule/testing-terraform-sentinel-policies-using-mocks). This session will be delivered on Wednesday, September 11 at 2:15pm PDT in Elwha B at the Hyatt Regency. It will show how you can generate Terraform Sentinel mocks from Terraform Cloud plans and use them to test Sentinel policies with the [Sentinel Simulator](https://docs.hashicorp.com/sentinel/intro/getting-started/install).

The full abstract is [here](https://hashiconf.hashicorp.com/schedule/testing-terraform-sentinel-policies-using-mocks).

## GCP Compute Instance Example
The [gcp-compute-instance](./gcp-compute-instance) directory contains some simple Terraform 0.12 code that creates two Google Cloud Platform (GCP) compute instances.

## AWS S3 Bucket
The [aws-s3-bucket](./aws-s3-bucket) directory contains some simple Terraform 0.12 code that creates a single S3 bucket that has the "private" canned ACL and is encrypted by a KMS key.

## Sentinel Policies, Test Cases, and Mocks
The [sentinel](./sentinel) directory contains two Sentinel policies, [restrict-gce-machine-type.sentinel](./gcp-compute-instance/restrict-gce-machine-type.sentinel) and [require-private-acl-and-kms-for-s3-buckets.sentinel](./aws-s3-bucket/require-private-acl-and-kms-for-s3-buckets.sentinel), along with Sentinel test cases and mocks that allow them to be tested with the Sentinel Simulator.

The restrict-gce-machine-type.sentinel policy requires all GCP compute instances to have machine types n1-standard-1, n1-standard-2, and n1-standard-4. This example includes one test case that passes and one that fails the policy.

The require-private-acl-and-kms-for-s3-buckets.sentinel policy requires all S3 buckets to use the "private" canned ACL and be encrypted with a KMS key. This example includes one test case that passes (by satisfying both conditions) and three test cases that fail the policy. One test case has an invalid ACL, one does not have encryption configured, and one fails both conditions. This example illustrates using more than one failure test case when a policy requires multiple conditions to be satisfied.

After downloading the Sentinel Simulator, adding it to your path, cloning this repository, and navigating to the sentinel directory, you can test the poicies with these commands:

Test Both Policies:
```
sentinel test
```

Test the GCP Policy:
```
sentinel test -run=gce
sentinel test -run=gce -verbose
```

Test the AWS policy:
```
sentinel test -run=s3
sentinel test -run=s3 -verbose
```

Note that the -run argument filters to policies with names that contain the argument and that the -verbose argument shows the outputs of print statements in the policies.
