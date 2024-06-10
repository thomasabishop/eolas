---
id: xowl
title: DynamoDB
tags: [AWS]
created: Sunday, June 09, 2024
---

# DynamoDB

## Data structure

### Non-relational tables

DynamoDB is "NoSQL" because it does not support #SQL queries and is
non-relational meaning there cannot be JOIN operations via
[foreign_keys](Foreign_keys_in_SQL.md)

![](../img/dynamodb.png)

### Primary key

Although the data is stored as a table, one of the attributes is a primary key
and the rest of the attributes are effectively the "value" associated with it.

Because DynamoDB is schemaless, neither the attributes or their data types need
to be defined beforehand and each item can have its own distinct attributes.

Each item in the table is uniquely identifiable by its primary key.

There are two types of primary key available:

- partition key: a simple primary key composed of one attribute only. Because
  the primary key is hash-mapped items can be retrieved very rapidly using the
  primary key. This would be the `personId` alone.

- composite key: this comprises a partition key and a _sort key_ both of which
  are attributes. In a table that has a partition key and a sort key, it's
  possible for multiple items to have the same partition key value. However,
  those items must have different sort key values. You could then query by
  either key or both. For instance using the `personId` along with `LastName`

### Secondary index

As well as the index provided by the primary key, you can set one or more
**secondary indices**. A secondary index lets you query the data in the table
using an alternate key.

A **global secondary index** is useful for querying data that needs to be
accessed using non-primary key attributes. For example, if you have a Users
table with `UserID` as the primary key but often need to fetch users by their
`Email`, a GSI on `Email` would be appropriate.

There are also **local secondary indices** but I don't understand the
difference.

## Real example

Below is a specification of the DynamoDB table I am using for my time-entries
project:

```json
{
  "TableName": "TimeEntries",
  "AttributeDefinitions": [
    {
      "AttributeName": "activity_start_end",
      "AttributeType": "S"
    },
    {
      "AttributeName": "start",
      "AttributeType": "S"
    },
    {
      "AttributeName": "activity_type",
      "AttributeType": "S"
    }
  ],
  "KeySchema": [
    {
      "AttributeName": "activity_start_end",
      "KeyType": "HASH"
    }
  ],
  "GlobalSecondaryIndexes": [
    {
      "IndexName": "StartIndex",
      "KeySchema": [
        {
          "AttributeName": "start",
          "KeyType": "HASH"
        },
        {
          "AttributeName": "activity_type",
          "KeyType": "RANGE"
        }
      ],
      "Projection": {
        "ProjectionType": "ALL"
      }
    }
  ]
}
```

This defines the attribute `activity_start_end` as the primary key. This string
(`S`) value is a concatenation of three attributes, which is a way of ensuring
each entry for the attribute will be unique.

I also define two GSIs. -- check that these are correct for getting entries by
range!

## Usage

## Related notes
