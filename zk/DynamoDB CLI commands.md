---
id: l045
title: DynamoDB CLI commands
tags: [AWS, databases, dynamodb]
created: Saturday, June 22, 2024
---

# DynamoDB CLI commands

## Connecting to a local (Docker)/prod (AWS) DynamoDB instance

In order to distinguish between local and production accounts you should keep
seperate profiles for each (via `.aws/config` and `.aws/credentials`).

When connecting to a local DB use the local profile and the local URL. Without
the `--profile` flag, AWS will default to the `default` profile which will
typically be your credentials for accessing AWS on the remote.

It also sometimes required to add the endpoint-url when working locally:

```
--endpoint-url http://localhost:800

> When using the commans below locally, assume `--endpoint-url` and `--profile`
> have been appended

```

For example:

```sh
aws dynamodb list-tables \
--profile timetracking_dev \
--endpoint-url http://localhost:800
```

## Delete a table

```sh
aws dynamodb delete-table \
--table-name TableName
```

## Create table from JSON schema

```sh
aws dynamodb create-table \
--cli-input-json file://create-timeentries-table.json \

```

## Describe the table

View the table schema:

```sh

aws dynamodb describe-table \
--table-name TimeEntries
```

## Scan the table

```sh
aws dynamodb scan \
--table-name TimeEntries \
--output table


```

## Related notes
