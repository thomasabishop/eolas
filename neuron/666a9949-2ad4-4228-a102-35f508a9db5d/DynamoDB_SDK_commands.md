---
id: 8b6h
tags: [AWS, databases, dynamodb]
created: Sunday, June 23, 2024
---

# DynamoDB SDK commands

The following commands are for using `@aws-sdk/client-dynamodb` (the JS SDK).

## Create client

```js
import DynamoDBClient from "@aws-sdk/client-dynamodb";

const client = new DynamoDBClient({
  region: "eu-west-2",
  accessKeyId: process.env.ACCESS_KEY_ID,
  secretAccessKey: process.env.ACCESS_KEY_ID,
});
```

### DynamoDB Document Client

The Document Client returns the data as a standard JSON document in the manner
of a document-based NoSQL database. Without it, DynamoDB will return the data
with type data which is unwieldy and hard to parse.

To transform into a document structure:

```js
import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({
  region: "eu-west-2",
  accessKeyId: process.env.ACCESS_KEY_ID,
  secretAccessKey: process.env.ACCESS_KEY_ID,
});

const dynamoDbDocumentClient = DynamoDBDocumentClient.from(client);
```

## Query a table

Querying is the most performant and cost-effective method since it is an O(1)
lookup against a partition key or secondary index.

```js
import { DynamoDBDocumentClient, QueryCommand } from "@aws-sdk/lib-dynamodb";

const params = {
  TableName: "YourTableName",
  KeyConditionExpression: "#pk = :pk",
  ExpressionAttributeNames: { "#pk": "PrimaryKeyAttributeName" },
  ExpressionAttributeValues: { ":pk": "PrimaryKeyValue" },
};

const dynamoDbDocumentClient = DynamoDBDocumentClient.from(client);
const data = await dynamoDbDocumentClient.send(new QueryCommand(params));
console.log(data);
```

## Scan a table

Scanning is less performant (O(n)) and most expensive since it requires checking
every item in the database.

```js
import { DynamoDBDocumentClient, ScanCommand } from "@aws-sdk/lib-dynamodb";

const params = {
  TableName: "YourTableName",
};

const dynamoDbDocumentClient = DynamoDBDocumentClient.from(client);
const data = await dynamoDbDocumentClient.send(new ScanCommand(params));
```

## Related notes
