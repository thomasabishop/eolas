---
categories:
  - DevOps
tags: [AWS]
---

# User management and roles

## IAM

> Identity and Access Management

An IAM user is an identity with long-term credentials that is used to interact
with AWS in an account. An IAM login is different from a root login. The root
user is the one who creates the AWS account and who has the power to delete it.
The root user can create IAM logins so that other users can log in through
dedicated IAM portals. The root user should also create an IAM login for himself
and use that, set to administrator policies, for most activities, reserving root
for the most consequential stuff like adding users etc.

## Users and user groups

- Use to create users and access rights accross the AWS services
- Users get permissions through policies (use template or create your own)
- You can also create user groups and add users to them to simplify role
  attribution

## Roles

Roles are adopted by _services_ rather than users. They run either periodically
(from a `cronjob` say) or when they are hit from an API.

This allows you to assign policies to a role that a service can adopt when
running. A good example is a lambda. Lambdas often need access to other services
such as an S3 bucket or a DynamoDB table. Say you have a service that combines a
lambda with a DynamoDB database. You could assign a role to the lambda and it
would have access to the database.

## Cognito

> Amazon Cognito provides authentication, authorization, and user management for
> your web and mobile apps.

There are **user pools** and **identity pools**.

User pools provide sign-up and sign-in options for your app users. Identity
pools provide AWS credentials to grant your users access to other AWS services.

You would use identity pools to manage access to API endpoints or S3 buckets.
They can be authenticated or unauthenticated. For example if you want to use an
image from S3 in a website you would authenticate for that, but you would
explicitly have to specify that it is general access by applying the policy
`AmazonS3ReadOnlyAccess`.
