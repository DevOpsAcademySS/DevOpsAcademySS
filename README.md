# Terraform plan for creating 2 instances on AWS
## Prerequisites
### External
* AWS Account
* AWS Identity and Access Management (IAM) user
* Generated programmatic AWS credentials
### Environment
* Terraform 1.0.8 (https://www.terraform.io/downloads.html)

## Preparation
Export programmatic AWS credentials to your environment.

## Usage
### Apply the infrastructure
```
terraform init
terraform plan
terraform apply
```
### Destroy the infrastructure
```
terraform destroy
```
