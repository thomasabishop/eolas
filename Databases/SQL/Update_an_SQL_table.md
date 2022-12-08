---
categories:
  - Databases
  - Programming Languages
tags: [SQL, relational-database]
---

# Updating an SQL table

We use the `ALTER` query to add, remove and otherwise change the structural properties of a table in the database.

## Add an additional field to existing table

This adds a `price` field to the `sales` table. The `price` field accepts data of the type `real`.

```sql
ALTER TABLE sales ADD price real;
```
