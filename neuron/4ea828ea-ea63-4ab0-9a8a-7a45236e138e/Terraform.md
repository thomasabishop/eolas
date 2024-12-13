---
tags: [AWS, IaC]
created: Saturday, November 16, 2024
---

# Terraform

## Authentication

Terraform will default to the currently active AWS user providing you have your
[AWS credentials](/zk/AWS_CLI.md) set-up.

## Creating resources

> Resources are specified in the `main.tf` file.

Create a new S3 bucket:

```hcl
resource "aws_s3_bucket" "my_new_bucket" {
    bucket = "my-new-bucket"
}
```

At this point the resource doesn't exist so there is no ARN or ID. When the
resource is created (through `terraform apply`) Terraform receives this info
from AWS and store it in a state file.

This info can be retrieved with `terraform show`, e.g:

```
resource "aws_s3_bucket" "my_new_bucket" {
    id                    = "my-new-bucket"
    arn                   = "arn:aws:s3:::my-new-bucket"
    bucket                = "my-new-bucket"
    bucket_domain_name    = "my-new-bucket.s3.amazonaws.com"
 }

```

## Standard sequence

Make your `terraform` directory, then `cd` and:

### Initialise project

```
terraform init
```

This will create the file `.terraform.lock.hcl` which should be committed. Stuff
in `.terraform/` can be git-ignored.

### Check changes

```
terraform plan
```

Providing you have written a `main.tf`. The command will list the proposed
changes to your resources.

### Apply changes

```
terraform apply
```

### Destroy the resource

Typically when you want to do a clean recreate.

```
terraform destoy
```

## Run with debug/logger

```
TF_LOG=DEBUG terraform apply
```

Or use with other Terraform command, e.g. `destroy`, `refresh` - whatever is
causing the problem.
