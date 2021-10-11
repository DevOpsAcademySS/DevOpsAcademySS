# Terragrunt

First [install][qk-st] [**Terraform**][trfrm] and [**Terragrunt**][trgnt] and go through [quick start][qk-st] to get basics.

[trfrm]:https://learn.hashicorp.com/tutorials/terraform/install-cli
[trgnt]:https://terragrunt.gruntwork.io/docs/getting-started/install/
[qk-st]:https://terragrunt.gruntwork.io/docs/getting-started/quick-start/

## Terragrunt Configuration Blocks and Attributes

---

In **Terragrunt** you have blocks and attributes here is the [link][blk-atr] for the doccumentaion.

[blk-atr]:https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/

## Terragrunt Features

---

**Terragrunt** has many features here is [link][feat] to them.

### Example

Good [example][kyc-dry] of how terraform works and how to use it.

[feat]:https://terragrunt.gruntwork.io/docs/#features
[kyc-dry]:https://terragrunt.gruntwork.io/docs/features/keep-your-terraform-code-dry/

## Terraform CLI

To run your **Terragrun** you need to use it's CLI here is the [link][trnt-cli] for the documentation.

[trnt-cli]:https://terragrunt.gruntwork.io/docs/reference/cli-options/

Basic commans:

* for single folder:

```sh
terragrunt [plan|apply|output|destroy]
# etc
```

* for child folders of root directory:

```sh
terragrunt run-all [validate|plan|apply|destroy|output] # run in root directory to apply for all child *.hcl files
```

## Useful Links

* [Terraform Google Provider docs](https://registry.terraform.io/providers/hashicorp/google/latest)

* [Terraform AWS Provider docs](https://registry.terraform.io/providers/hashicorp/aws/latest)