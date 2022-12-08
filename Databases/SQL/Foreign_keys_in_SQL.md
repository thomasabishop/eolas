---
categories:
  - Databases
  - Programming Languages
tags: [SQL, relational-database]
---

# Creating views with foreign keys

We utilise **foreign** and [primary keys](/Databases/Relational_Databases/Primary_key.md) to create relationships between tables in SQL. Foreign keys link data in one table to the data in another table and are how we cross-reference data in SQL.

<!-- We can use this technique to create new tables from existing tables in the database or to generate [views](/Databases/Relational_Databases/Views_in_relational_databases.md). -->

In essence you use the primary key of one table to access data in another table.

Let's say we have a `sales` table:

| saleId | modelId | saleDate   | employeeId | price  |
| ------ | ------- | ---------- | ---------- | ------ |
| 1      | 44      | 2020-07-27 | tbishop    | 399.99 |
| 2      | 22      | 2021-02-05 | tbishop    | 200.99 |

In SQL this would be set up as follows:

```sql
CREATE TABLE sales (
  saleId integer PRIMARY KEY,
  modelId integer,
  saleDate date,
  employeeId text,
  price float
)
```

For every model that is sold it is possible for the customer to return it. This data will be kept in another table `returns`. Every model sold will have an entry in `sales` but may or may not have an entry in `returns` (not every customer will return an item).

We want to establish a relationship between the two tables so that if an item is returned we can trace it back to its original sale.

As the `saleId` is the primary key in `sales` this means it is a unique identifier for each model sold. We will therefore use this in our `returns` table to track the sale data.

Here's our `returns` table:

| returnId | saleId | returnDate  | reason                                         |
| -------- | ------ | ----------- | ---------------------------------------------- |
| 7899     | 1      | 2020-11-218 | New device issued under warranty due to defect |
| 6711     | 2      | 2022-09-02  | Returned gift                                  |

n this table `saleId` is identical to `saleId` in sales. It is the primary key in `sales` but a foreign key in `returns`. There is a one-to-one correspondance at work here. If a device has been returned it must have an entry in `returns` and the `salesId` of the entry in `returns` must match the `salesId` in `sales`.

We already have the `sales` table. We want to create new table called `returns` that will sustain a one-to-one relationship with `sales`. We are going to use the `sale_id` as our foreign key in `returns`. This is the primary key in `sales`.

We establish this with the following SQL:

```sql
CREATE TABLE returns (
	returnId integer PRIMARY KEY,
	saleId integer NOT NULL,
	returnDate date,
	reason text,
	FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
	);
```

https://www.cockroachlabs.com/blog/what-is-a-foreign-key/

---

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
