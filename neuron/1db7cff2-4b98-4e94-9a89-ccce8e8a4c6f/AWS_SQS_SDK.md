---
tags: [AWS, SQS]
created: Monday, November 25, 2024
---

# AWS SQS SDK

## Initialising the SQS client

```ts
import { SQSClient } from "@aws-sdk/client-sqs";

const sqs = new SQSClient({ region: "us-east-1" });
```

## Sending a message to the queue

```ts
import { SendMessageCommand } from "@aws-sdk/client-sqs";

const command = new SendMessageCommand({
  QueueUrl: queueUrl,
  MessageBody: messageBody,
  // Optional parameters
  DelaySeconds: 0,
  MessageAttributes: {
    CustomAttribute: {
      DataType: "String",
      StringValue: "CustomValue",
    },
  },
});

return await sqs.send(command);
```

## Processing messages on the queue

```ts
import { ReceiveMessageCommand } from "@aws-sdk/client-sqs";

const command = new ReceiveMessageCommand({
  QueueUrl: queueUrl,
  MaxNumberOfMessages: 10,
  WaitTimeSeconds: 20, // Long polling
  VisibilityTimeout: 30, // Time other consumers won't see this message
});

const response = await sqs.send(command);

// Then do something

for (const message of response.Messages || []) {
  console.log(message);
}
```

## Removing message from queue

```ts
import { DeleteMessageCommand } from "@aws-sdk/client-sqs";

for (const message of response.Messages || []) {
  await sqs.send(
    new DeleteMessageCommand({
      QueueUrl: queueUrl,
      ReceiptHandle: message.ReceiptHandle,
    }),
  );
}
```

## Query a DLQ

```ts
const checkDLQ = async (dlqUrl: string) => {
  const command = new GetQueueAttributesCommand({
    QueueUrl: dlqUrl,
    AttributeNames: ["ApproximateNumberOfMessages"],
  });

  const response = await sqs.send(command);
  return response.Attributes?.ApproximateNumberOfMessages;
};
```
