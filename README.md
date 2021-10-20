# Multi-Cloud (AWS and GCP) IaC with Terraform empowered with Terragrunt
## Prerequisites
### External
* AWS Account, Identity and Access Management (IAM) user and generated programmatic credentials.
* GCP Account, project and generated programmatic credentials.
### Environment
* Terraform 1.0.8 (https://www.terraform.io/downloads.html)
* Terragrunt (https://github.com/gruntwork-io/terragrunt/releases)

## Preparation
* Export all programmatic credentials for all clouds/systems to your environment:
![image](https://user-images.githubusercontent.com/64926867/138105063-0163fbcf-4c4d-4260-b99d-98fef1af2e4e.png)(https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
![image](https://user-images.githubusercontent.com/64926867/138105143-a37df8ff-bdf6-425c-bc97-06b5f2adb224.png)(https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference)
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
