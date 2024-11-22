---
tags: [AWS]
---

# AWS Messaging services

## SNS

> SNS: Simple Notification Service

Similar to SQS but the focus is on notifications rather than messages, i.e
events that fire when something specific happens, not just a message-send event.
It can be used for passing notifications between applications or to persons
through SMS, text, push notifications and email.

**SNS pushes messages out to subscribers while SQS stores the messages until
someone reads them.**

Relation between SNS and SQS - typically paired aren't they.
