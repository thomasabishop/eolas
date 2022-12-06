---
categories:
  - Databases
  - Programming Languages
tags: [SQL]
---

# Deleting data in SQL

## Deleting records

We use `DELETE` to delete existing records in a table. Once this is applied, the records are permanently deleted.

To delete **all records** whilst maintaining the table:

```sql
DELETE FROM sales
```

We can also use `TRUNCATE` to achieve this. It is faster but it doesn't keep a log of each deletion:

```sql
TRUNCATE TABLE sales
```

To delete a **specifc entry** by field:

```sql
DELETE FROM sales WHERE sale_id = 1;
```

## Deleting tables

We use `DROP` to remove an entire table. This will delete the table definition, and all the data, indexes, triggers, constraints and permission specifications for that table.

```sql
DROP TABLE sales
```
