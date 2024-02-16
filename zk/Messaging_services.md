---
categories:
  - DevOps
tags: [AWS]
---

# AWS Messaging services

## SQS

> SQS: Simple Queue Service

SQS is a service that allows you to send, store and receive messages between
apps and software components built in AWS, with automatic encryption. It helps
with decoupling and scaling.

As the name indicates, its operating mode is that of a
[queue](/Data_Structures/Queue.md) data structure offering first-in, first-out
and other queue implementations.

An example application of this would be to set up an SQS queue that receives
messages and triggers a lambda whenever a new message is added.

## SNS

> SNS: Simple Notification Service

Similar to SQS but the focus is on notifications rather than messages, i.e
events that fire when something specific happens, not just a message-send event.
It can be used for passing notifications between applications or to persons
through SMS, text, push notifications and email.

**SNS pushes messages out to subscribers while SQS stores the messages until
someone reads them.**
