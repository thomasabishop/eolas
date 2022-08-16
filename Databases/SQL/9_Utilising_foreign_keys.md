---
categories:
  - Databases
  - Programming_Languages
tags: [SQL]
---

# SQL: Creating relationships between tables with `PRIMARY` and `FOREIGN` keys

We will demonstrate with an example. We already have the `sales` table. We want to create new table called `returns` that will sustain a one-to-one relationship with `sales`. We are going to use the `sale_id` as our foreign key in `returns`. This is the primary key in `sales`.

The `sales` table:

```
sale_id     model_id    sale_date   employee_id  price
----------  ----------  ----------  -----------  ----------
1           44          2020-07-27  tbishop      399.99
2           22          2021-02-07  tbishop      200.99
```

Creating the `returns` table and establishing relationship with `sales` using the `FOREIGN KEY` keyword:

```sql
CREATE TABLE returns (
	return_id integer PRIMARY KEY,
	sale_id integer NOT NULL,
	date_returned text,
	reason text,
	FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
	);
```

Here's an example with more than one foreign key:

```sql
CREATE TABLE returns (
    return_id integer PRIMARY KEY,
    sale_id integer NOT NULL,
    employee_id text NOT NULL,
    date_returned text,
    reason text,
    FOREIGN KEY(sale_id) REFERENCES sales(sale_id),
    FOREIGN KEY(employee_id) REFERENCES employee(employee_id)
    );
```
