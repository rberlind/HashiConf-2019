# HashiConf 2019
This repository contains Terraform code, Sentinel policies, and Sentinel mocks for my HashiConf 2019 session called [Testing Terraform Sentinel Policies Using Mocks](https://hashiconf.hashicorp.com/schedule/testing-terraform-sentinel-policies-using-mocks). This session will be delivered on Wednesday, September 11 at 2:15pm PDT in Elwha B at the Hyatt Regency. It will show how you can generate Terraform Sentinel mocks from Terraform Cloud plans and use them to test Sentinel policies with the [Sentinel Simulator](https://docs.hashicorp.com/sentinel/intro/getting-started/install).

The full abstract is [here](https://hashiconf.hashicorp.com/schedule/testing-terraform-sentinel-policies-using-mocks).

## GCP Compute Instance Example
The [gcp-compute-instance](./gcp-compute-instance) directory contains some simple Terraform 0.12 code that creates two Google Cloud Platform (GCP) compute instances. It also contains a Sentinel policy, [restrict-gce-machine-type.sentinel](./gce-compute-instance/restrict-gce-machine-type.sentinel) that requires all GCP compute instances to have machine types in a given list. Finally, it contains Sentinel test cases and mock files that allows the policy to be tested with the Sentinel Simulator.

## AWS S3 Bucket
The [aws-s3-bucket](./aws-s3-bucket)directory contains some simple Terraform 0.12 code that creates a single S3 bucket that has the "private" canned ACL and is encrypted by a KMS key. It also contains a Sentinel policy, [require-private-acl-and-kms-for-s3-buckets.sentinel](./aws-s3-bucket/require-private-acl-and-kms-for-s3-buckets.sentinel) that requires all S3 buckets to use the "private" canned ACL and be encrypted with a KMS key. Finally, it contains Sentinel test cases and mock files that allows the policy to be tested with the Sentinel Simulator.
