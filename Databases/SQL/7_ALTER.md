---
categories:
  - Databases
  - Programming Languages
tags: [SQL]
---

# SQL: ALTER

We use the `ALTER` query to add, remove and otherwise change the structural properties of a table.

## Add an additional field to existing table

This adds a `price` field to the `sales` table. The `price` field accepts data of the type `real` . `real` is a slightly less precise (less memory) version of float

```sql
ALTER TABLE sales ADD price real;
```
