---
categories:
  - DevOps
  - Backend
tags: [AWS, aws-lambda, node-js, python]
---

# AWS Lambda triggers

Here are some common trigger patterns

### API Gateway trigger

- an HTTP request is sent to AWS API Gateway
- API Gateway triggers a Lambda function to execute

### DynamoDB table change trigger

- a record in a DynamoDB table is modified
- DynamoDB triggers a lambda function to execute

### S3 trigger

- a new file is created in S3
- S3 triggers a Lambda function to execute

### SQS trigger

- a new message is added to an [SQS](/DevOps/AWS/AWS_Messaging_services.md#sqs) queue
- SQS triggers a Lambda function to execute
