---
tags: [AWS, SNS, SQS]
created: Monday, November 25, 2024
---

# AWS SNS

The Simple Notification Service is another form of messaging service in AWS,
similar to [SQS](AWS_SQS.md). The key difference is that SNS pushes messages out
to subscribers whereas SQS stores the messages until they are processed.

Before a message can be sent, and SNS topic must exist. One service such as a
lambda will _publish_ to this topic. Another service, will _subscribe_ to the
topic and be alerted when a message is sent to it.

With SNS, one message can be sent to multiple subscribers simultaneously. In
addition there is message filtering at the subscription level so subscribers can
choose to receive only the messages they are interested in.

Many other AWS services can act as SNS subscribers. Some common examples:

- SQS queues
- Lambda functions (trigger on receipt of a message)
- HTTP endpoints
- Email/SMS/Push notifications to mobile apps

## Combining with SQS

Utilising SNS with SQS is a common pattern in serverless applications.

We use SNS to decouple publishers from subscribers and then use SQS to handle
the different subscriber tasks. This is known as the "Fanout-Queue" pattern.

![SQS fanout pattern](../img/sns-example.png)

For example, an order is placed which results in a publication event to an SNS
topic.

Multiple systems subscribe to this topic, e.g. an inventory system, a shipping
system and an analytics system.

Each system has its own queue for processing the message.
