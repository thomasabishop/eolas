---
id: l045
title: DynamoDB CLI commands
tags: [AWS, databases, dynamodb]
created: Saturday, June 22, 2024
---

# DynamoDB CLI commands

## Connecting to a local (Docker) DynamoDB instance

In order to distinguish between local and production accounts you should keep
seperate configs in `.aws/config` and `.aws/credentials`. Then specify the
profile if you are working locally and the local URL. Without the `--profile`
flag, AWS will default to the `default` profile which will typically be your
credentials for accessing AWS on the remote.

```sh
aws dynamodb list-tables --profile timetracking_dev --endpoint-url
http://localhost:800
```

## Delete a table

```sh
aws dynamodb delete-table \
--profile timetracking_local \
--endpoint-url http://localhost:8000 \
--table-name TableName
```

## Create table from JSON schema

```sh
aws dynamodb create-table \
--cli-input-json file://create-timeentries-table.json \
--profile timetracking_local \
--endpoint-url http://localhost:8000

```

## Related notes
