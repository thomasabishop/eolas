---
tags: [AWS]
---

# AWS CLI frequent commands

### Retrieve current user

```
aws-sts get-caller-identity
```

### List users

```
aws configure list
aws configure list-profiles
```

### View profile data

```
vim ./aws/credentials
```

## CloudFormation

### List stacks

```
aws cloudformation --list-stacks
```

### Delete a stack

```
aws cloudformation delete-stack --stack-name <my_stack> --region <region>
```

`region` is optional especially if only deployed to one region

## Billing ("Cost explorer")

### Usage for month

```
 aws ce get-cost-and-usage --time-period Start=$(date +%Y-%m-01),End=$(date -d @$(( $(date +%s) + 86400 )) +%Y-%m-%d) --granularity MONTHLY --metrics "UnblendedCost" "UsageQuantity
```
