---
categories:
  - Databases
  - Programming Languages
tags: [SQL]
---

# SQL: CREATE

## Create a table (`CREATE`)

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

We specify the new table name first, then it's fields and their corresponding data types. We also set a primary key
