# Multi-Cloud (AWS and GCP) IaC with Terraform empowered with Terragrunt
## Prerequisites
### External
* AWS Account, Identity and Access Management (IAM) user and generated programmatic credentials.
* GCP Account, project and generated programmatic credentials.
### Environment
* Terraform 1.0.8 (https://www.terraform.io/downloads.html)
* Terragrunt (https://github.com/gruntwork-io/terragrunt/releases)

## Preparation
* Export all programmatic credentials for all clouds/systems to your environment.
* Create resources to store remote backend:
### Manually
Create resources using names, which are assinged in `remote_state` block in `terragrunt.hcl` file, on:
* S3 bucket
* Dynamo DB
or
### Using terraform
```
cd backend_init
terraform init
terraform plan
terraform apply
```
## Usage
### Apply AWS stack (or other, GCP)
```
cd aws
terragrunt init
terragrunt run-all plan
terragrunt run-all apply
```
### Apply all stacks
```
terragrunt init
terragrunt run-all plan
terragrunt run-all apply
```
### Destroy all stacks
```
# first, return to project root directory
terragrunt run-all destroy
```
