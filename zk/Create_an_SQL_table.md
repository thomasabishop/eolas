---
tags: [SQL, relational-databases]
---

# Create an SQL table

We create tables in an SQL database with the `CREATE` command.

Below is an example of this in practice. Each field corresponds to a column. We
specify the name of the field and its corresponding
[data type](Data_types_in_MySQL.md). Every table must have a
**primary key**. In the example, `employee_id` is the primary key.

```sql
CREATE TABLE employee (
    employee_id text PRIMARY KEY,
    first_name text,
    surname text,
    address_number integer,
    address_1 text,
    address_2 text,
    locality text,
    region text,
    postal_code text,
    phone_number text,
    days_per_week real
    );
```

## Check table metadata

We can use `DESCRIBE [table_name]` any time we want to list out the data types
and other metadata about the table.

We can use `SHOW TABLE STATUS`/
