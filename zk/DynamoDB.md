---
id: xowl
title: DynamoDB
tags: [AWS]
created: Sunday, June 09, 2024
---

# DynamoDB

## Data structure

DynamoDB is "NoSQL" because it does not support #SQL queries and is
non-relational meaning there cannot be JOIN operations via
[foreign_keys](Foreign_keys_in_SQL.md)

![](../img/dynamodb.png)

Although the data is stored as a table, one of the attributes is a key and the
rest of the attributes are effectively the values associated with it. Each item
in the table is uniquely identifiable by its primary key.

Because DynamoDB is schemaless, neither the attributes or their data types need
to be defined beforehand and each item can have its own distinct attributes.

This attribute is known as the primary key.

## Usage

## Related notes
